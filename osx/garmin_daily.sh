#!/usr/bin/env bash
# send Garmin Connect data to google sheets

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"
# shellcheck source=./osx/.garminsecrets
source "${home}/.garminsecrets"

echo $(date) "garmin-daily" >> "${sync_log}"
"/Users/${IAM}/Library/CloudStorage/OneDrive-EPAM/projects/learn/garmin-daily/venv/bin/garmin-daily" \
  >> "${sync_log}"
