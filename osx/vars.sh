#!/bin/bash

IAM=$(whoami)
SCRIPTS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Avoid direct using of the $HOME
if [[ "${SCRIPTS_FOLDER}" == *"linux-conf"* ]]; then  # debugging from project folder
  home=$HOME
else  # scripts folder is one level down $HOME
  home=$( dirname "$SCRIPTS_FOLDER")
fi

sync_logs_folder="${home}/logs/sync"
mkdir -p "${sync_logs_folder}"
sync_log="${sync_logs_folder}/$(date +"%Y-%m-%d").log"
fail="${sync_logs_folder}/_fail.txt"

send_fail_email()
# argument - email body
{
    echo $1 | mail -s "MacBook Sync failed" filbert@yandex.ru
    exit
}