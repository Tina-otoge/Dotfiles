#!/bin/sh

folder="${HOME}"'/Pictures/Wallpapers/tokyo drifts/'
pause=1000
while true; do
    pic=$(find "$folder"* | shuf -n 1)
    feh --no-fehbg --bg-fill "$pic"
#    wal -i "$pic"
    sleep $pause
done
# vim:ft=sh
