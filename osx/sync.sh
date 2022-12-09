#!/bin/bash
rsync --archive --update --stats --delete /Users/sorokan6/Documents/ "/Users/sorokan6/Library/CloudStorage/OneDrive-Personal/Documents"
date >> /Users/sorokan6/sync.log
