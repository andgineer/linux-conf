#!/usr/bin/env bash
# rsync Obsidian folder from iCloud to OneDrive on EPAM

home="/Users/Andrei_Sorokin2/"
source="${home}Library/Mobile Documents/iCloud~md~obsidian/Documents/anso-mobile/"
min_size=300000
target="${home}Library/CloudStorage/OneDrive-EPAM/backup/obsidian/anso-mobile"
fail="${home}Library/CloudStorage/OneDrive-EPAM/FAIL.txt"

"${home}scripts/rsync.sh" "${home}" "${source}" "${target}" "${min_size}" "$fail"
