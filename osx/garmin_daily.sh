#!/usr/bin/env bash
# send Garmin Connect data to google sheets

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"
# shellcheck source=./osx/.garminsecrets
source "${home}/.garminsecrets"

echo $(date) "garmin-daily" >> "${sync_log}"
"/Users/${IAM}/projects/garmin-daily/.venv/bin/garmin-daily" \
  -g mon -g wed -g fri -g sat -l "roller=Телеп" -l "trail=Телеп" -r "trail=Roller skiing" \
  >> "${sync_log}"

if [ $? -ne 0 ]; then
    send_fail_email "Failed to send Garmin Connect data to google sheets"
fi
