#!/usr/bin/env bash
# call this scripts as
#   rsync.sh "${source}" "${target}" "${min_size}" "${log}" "$fail"
#
# sync $source to $target if it is bigger that $min_size
# log sync dates and rsync errors to $log file
# if source is too small write to file $fail

source="$1"
target="$2"
min_size="$3"
log="$4"
fail="$5"

echo ""  >> "${log}"
date >> "${log}"

size=$(du -kc "${source}" | tail -1 | cut -f1)

if [ "$size" -gt "${min_size}" ]; then
rsync \
        --archive \
        --update \
        --stats \
        --delete \
        "${source}" \
        "${target}" \
        2>> "${log}"
else
  # shellcheck disable=SC2129
  echo "" >> "${fail}"
  date >> "${fail}"
  echo "Obsidian folder is less than ${min_size}M" >> "${fail}"
fi