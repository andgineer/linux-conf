#!/usr/bin/env bash

scripts_folder="$HOME/scripts"

mkdir -p "${scripts_folder}"

cp osx/vars.sh "${scripts_folder}"
cp osx/rsync.sh "${scripts_folder}"
cp osx/rsync_icloud_obsidian_to_onedrive_epam.sh "${scripts_folder}"
