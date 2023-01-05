#!/usr/bin/env bash
# rsync Obsidian folder from iCloud to OneDrive on EPAM

home="/Users/Andrei_Sorokin2/"
source="${home}Library/Mobile Documents/iCloud~md~obsidian/Documents/anso-mobile/"
target="${home}Library/CloudStorage/OneDrive-EPAM/backup/obsidian/anso-mobile"
fail="${home}Library/CloudStorage/OneDrive-EPAM/FAIL.txt"

echo ""  >> "${home}sync.log"
date >> "${home}sync.log"

size=$(du -kc "${source}" | tail -1 | cut -f1)

if [ "$size" -gt 300000 ]; then
rsync \
        --archive \
        --update \
        --stats \
        --delete \
        "${source}" \
        "${target}" \
        2>> "${home}sync.log"
else
  # shellcheck disable=SC2129
  echo "" >> "${fail}"
  date >> "${fail}"
  echo "Osidian folder is less than 300M" >> "${fail}"
fi
