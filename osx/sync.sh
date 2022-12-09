#!/bin/bash
echo ""  >> /Users/sorokan6/sync.log
date >> /Users/sorokan6/sync.log

rsync \
        --archive \
        --update \
        --stats \
        --delete \
        /Users/sorokan6/Documents/ \
        "/Users/sorokan6/Library/CloudStorage/OneDrive-Personal/Documents" \
        >> /Users/sorokan6/sync.log

rsync \
        --archive \
        --update \
        --stats \
        --delete \
        "/Users/sorokan6/сербский/" \
        "/Users/sorokan6/Library/CloudStorage/OneDrive-Personal/сербский" \
        >> /Users/sorokan6/sync.log
