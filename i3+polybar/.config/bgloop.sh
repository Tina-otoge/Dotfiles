#!/usr/bin/env bash

folder="${HOME}"'/Pictures/Wallpapers/'
pause=1000
while true; do
     pic=$(find "$folder"* | shuf -n 1)
     feh --no-fehbg --bg-fill "$pic"
#     wal -i "${HOME}"'/Pictures/Wallpapers/yorha_fhd.png'
     sleep $pause
 done
# vim:ft=sh
