#!/usr/bin/env bash
# rsync Documents folder (OneDrive EPAM) to OneDrive Personal

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

source="${home}/Library/CloudStorage/OneDrive-EPAM/Documents/"
min_size=50000
target="${home}/Library/CloudStorage/OneDrive-Personal/backup/Documents"

"${SCRIPTS_FOLDER}/rsync.sh" "${source}" "${target}" "${min_size}" "${sync_log}" "$fail"
