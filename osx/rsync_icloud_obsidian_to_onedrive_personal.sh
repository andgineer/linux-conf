#!/usr/bin/env bash
# rsync Obsidian folder from iCloud to OneDrive Personal

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

source="${home}/Library/Mobile Documents/iCloud~md~obsidian/Documents/anso-mobile/"
min_size=300000
target="${home}/Library/CloudStorage/OneDrive-Personal/backup/obsidian/anso-mobile"

"${SCRIPTS_FOLDER}/rsync.sh" "${source}" "${target}" "${min_size}" "${sync_log}" "$fail"
