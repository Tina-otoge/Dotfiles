#!/bin/sh

function ask_folder() {
    read -p "Do you want to install $1 ? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 1
    fi
    return 0
}

CURRENT='i3+polybar/'

if ask_folder $CURRENT == 1; then
    FILES=('.config/fehbg' '.config/wallpaper.png' '.config/i3' '.config/polybar')
    for f in $FILES; do
        ln -b -s $CURRENT$f "~/$f"
    done
fi

CURRENT='bash/'

if ask_folder $CURRENT == 1; then
    FILES=('.bashrc' '.config/aliases')
    for f in $FILES; do
        ln -b -s $CURRENT$f "~/$f"
    done
fi
