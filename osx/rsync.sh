#!/usr/bin/env bash
# call this scripts as
#   rsync.sh "${home}" "${source}" "${target}" "${min_size}" "$fail"
#
# sync $source to $target if it is bigger that $min_size
# log sync dates and rsync errors to "${home}sync.log"
# if source is too small write to file $fail

home="$1"
source="$2"
target="$3"
min_size="$4"
fail="$5"

echo ""  >> "${home}sync.log"
date >> "${home}sync.log"

size=$(du -kc "${source}" | tail -1 | cut -f1)

if [ "$size" -gt "${min_size}" ]; then
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
  echo "Obsidian folder is less than ${min_size}M" >> "${fail}"
fi