#!/bin/bash

if ! [ $(id -u) = 0 ]; then
	echo Run as root or use \"sudo $0\"
	exit 1
fi

files='
lightdm.conf
lightdm-gtk-greeter.conf
lightdm-webkit2-greeter.conf
'

backup() {
	[ -f "$1" ] && mv "$1" "$1"'.backup'
}

dest='/etc/lightdm'

for file in $files; do
	target="$dest"/"$file"
	backup "$target"
	cp "$file" "$target"
done

