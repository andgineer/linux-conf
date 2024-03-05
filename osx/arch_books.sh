#!/usr/bin/env bash
# create books folder archive on OneDrive on EPAM

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

source="${home}"
target="${home}/Library/CloudStorage/OneDrive-EPAM/backup"

tar -czf "${target}/books-$(date +'%Y-%m-%d').tar"  -C "${source}" books

if [ $? -ne 0 ]; then
    send_fail_email "Failed to create books archive"
fi