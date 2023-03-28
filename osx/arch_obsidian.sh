#!/usr/bin/env bash
# create iCloud Obsidian folder archive on OneDrive on EPAM

# Avoid direct using of the $HOME
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=./osx/vars.sh
source "${SCRIPTS_FOLDER}/vars.sh"

source="${home}/Library/Mobile Documents/iCloud~md~obsidian/Documents"
target="${home}/Library/CloudStorage/OneDrive-EPAM/backup"

tar -czf "${target}/obsidian-$(date +'%Y-%m-%d').tar"  -C "${source}" anso-mobile