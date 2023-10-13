#!/usr/bin/env bash
# create projects folder archive on OneDrive on EPAM

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

source="${home}"
target="${home}/Library/CloudStorage/OneDrive-EPAM/backup"

tar -czf "${target}/projects-$(date +'%Y-%m-%d').tar"  -C "${source}" projects

if [ $? -ne 0 ]; then
    send_fail_email "Failed to create projects archive"
fi