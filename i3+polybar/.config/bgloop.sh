#!/usr/bin/env bash

folder="${HOME}"'/Pictures/Wallpapers/silverdragon-bemani/iidx-logo'
pause=1000
while true; do
    pic=$(find "$folder"* | shuf -n 1)
#    feh --no-fehbg --bg-fill "$pic"
    wal -i "$pic" -b '#272822'
    sleep $pause
done
# vim:ft=sh
