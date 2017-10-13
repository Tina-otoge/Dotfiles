#!/usr/bin/env sh
trap '' 2

echo Nope! ♥

photo='/tmp/tmp.png'
file='/tmp/lockcam.png'
over_file='/tmp/lockcamover.png'
over="$HOME"'/.config/i3/camover.png'
copy_folder="$HOME"'/Pictures/Tentatives'
logo="$HOME"'/.config/i3/logolock.png'

rm -f "$photo"

scrot -e 'mv $f '"$file"
height=$(identify -format '%H' "$file")
width=$(identify -format '%W' "$file")

echo "Cheeeeeese~"

ffmpeg -f video4linux2 -s "$width"x"$height" -loglevel panic -i /dev/video0 -frames 1 "$photo" > /dev/null & 
wait

echo "Click !!"

if [ -d $copy_folder ] && [ -f "$photo" ]; then
    cp "$photo" "$copy_folder/$(date).png" >/dev/null
fi

convert "$photo" -resize "$width"x"$height" "$file" >& /dev/null
wait

composite "$over_file" -gravity SouthEast "$file" "$file" >& /dev/null
wait

if [ -f "$logo" ]; then
    composite "$logo" -dissolve 35% -gravity NorthEast "$file" "$file"
fi

convert "$file" -pointsize 50 -fill white -undercolor '#00000080' -gravity South -annotate +0+5 'Alors comme ça on essaie\n de conf ma machine ?' "$file" &
wait

i3lock -n -f -i "$file"
