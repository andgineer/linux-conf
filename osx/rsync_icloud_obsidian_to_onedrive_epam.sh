#!/usr/bin/env bash
# rsync Obsidian folder from iCloud to OneDrive on EPAM

# shellcheck source=./osx/vars.sh
. "${HOME}/scripts/vars.sh"

source="${HOME}/Library/Mobile Documents/iCloud~md~obsidian/Documents/anso-mobile/"
min_size=300000
target="${HOME}/Library/CloudStorage/OneDrive-EPAM/backup/obsidian/anso-mobile"
fail="${HOME}/Library/CloudStorage/OneDrive-EPAM/FAIL.txt"

"${HOME}/scripts/rsync.sh" "${source}" "${target}" "${min_size}" "${sync_log}" "$fail"
