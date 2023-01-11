#!/bin/bash

SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Avoid direct using of the $HOME
if [[ "${SCRIPTS_FOLDER}" == *"linux-conf"* ]]; then  # debugging from project folder
  home=$HOME
else  # scripts folder is one level down $HOME
  home=$( dirname "$SCRIPTS_FOLDER")
fi

sync_log="${home}/sync.log"
fail="${home}/FAIL.txt"
