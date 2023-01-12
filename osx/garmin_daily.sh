#!/usr/bin/env bash
# rsync Documents folder (OneDrive EPAM) to OneDrive Personal

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"
# shellcheck source=./osx/.garminsecrets
source "${home}/.garminsecrets"

echo $(date) "garmin-daily" >> "${sync_log}"
"/Users/Andrei_Sorokin2/Library/CloudStorage/OneDrive-EPAM/projects/learn/garmin-daily/venv/bin/garmin-daily" \
  >> "${sync_log}"
