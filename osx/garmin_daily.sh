#!/usr/bin/env bash
# rsync Documents folder (OneDrive EPAM) to OneDrive Personal

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

echo $(date) "garmin-daily" >> "${sync_log}"
env GARMIN_PASSWORD="****" GARMIN_EMAIL="filbert@yandex.com" \
  "/Users/Andrei_Sorokin2/Library/CloudStorage/OneDrive-EPAM/projects/learn/garmin-daily/venv/bin/garmin-daily" \
  >> "${sync_log}"
