#!/usr/bin/env bash

scripts_folder="$HOME/scripts"

mkdir -p "${scripts_folder}"

cp osx/vars.sh "${scripts_folder}"
cp osx/rsync.sh "${scripts_folder}"
cp osx/rsync_icloud_obsidian_to_onedrive_epam.sh "${scripts_folder}"
cp osx/rsync_documents_to_onedrive_personal.sh "${scripts_folder}"
cp osx/rsync_shelf_to_onedrive_personal.sh "${scripts_folder}"
cp osx/rsync_icloud_obsidian_to_onedrive_personal.sh "${scripts_folder}"
cp osx/garmin_daily.sh "${scripts_folder}"
cp osx/arch_obsidian.sh "${scripts_folder}"
cp osx/arch_shelf.sh "${scripts_folder}"
cp osx/goodreads.sh "${scripts_folder}"
cp osx/arch_documents.sh "${scripts_folder}"
