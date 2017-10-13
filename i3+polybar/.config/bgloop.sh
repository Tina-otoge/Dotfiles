#!/bin/sh

folder="${HOME}"'/Pictures/Wallpapers/chainsaw/'
pause=100
while true; do
    pic=$(find "$folder"* | shuf -n 1)
    feh --no-fehbg --bg-fill "$pic"
    sleep $pause
done
# vim:ft=sh
