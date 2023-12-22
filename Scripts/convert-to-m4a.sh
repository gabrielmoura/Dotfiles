#!/usr/bin/env bash

until [[ "$1" = '' ]]; do
  ffmpeg -i "$1" -f wav - | neroAacEnc -if - -ignorelength -q 0.4 "${1%.*}.m4a"
  tags=()
  while read -r; do
    tags+=("$REPLY")
  done < <(ffprobe -i "$1" -show_format 2>/dev/null | sed -ne 's/date/year/' -e '/TAG:/s/TAG/-meta/p')
  neroAacTag "${1%.*}.m4a" "${tags[@]}"
  shift
done
exit 0
