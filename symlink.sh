#!/usr/bin/env bash

echo Welcome to Tina\'s dotfiles linking script.
echo
echo This script\'s purpose is to help you installing my config files \(dotfiles\) to
echo the corresponding folder without moving them.
echo
echo When entering \"y\" to install the files for a specific software \(i.e.: vim\) it
echo will symink the file from the current folder to the appropriate place in your
echo file system. \(i.e.: ./vim/.vimrc ==\> ~/.vimrc\)
echo
echo Entering \"y\" will NOT install the corresponding packages. See install.sh for
echo this.

HERE="$(pwd)/$(dirname "$0")"
BACKUP_DIR="$HERE/backups/"

function ask_folder() {
    read -p "Do you want to install $1 ? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

function sym() {
    DEST_FILE="$(basename "$1")"
    DEST="$2$DEST_FILE"
    HERESRC="$HERE/$1"
    echo $HERESRC -\> $DEST
    if [[ -f $DEST || -L $DEST || -d $DEST ]]; then
        BACKUP_DESTDIR=$BACKUP_DIR"$(dirname "$1")"
        echo Destination already exists! Backuping to "$BACKUP_DESTDIR/$DEST_FILE"
        mkdir -p "$BACKUP_DESTDIR"
        mv "$DEST" "$BACKUP_DESTDIR/"
    fi
    ln -s $HERESRC $DEST
    echo Symlink: done.
}

mkdir -p $BACKUP_DIR
mkdir -p "$HOME/.config"

if ask_folder "i3+polybar(&rofi&compton)"; then
    SRC="i3+polybar"
    sym "$SRC/.config/initbg.sh" "$HOME/.config/"
    sym "$SRC/.config/bgloop.sh" "$HOME/.config/"
    sym "$SRC/.config/i3" "$HOME/.config/"
    sym "$SRC/.config/polybar" "$HOME/.config/"
    sym "$SRC/.config/rofi" "$HOME/.config/"
    sym "$SRC/.config/compton.conf" "$HOME/.config/"
fi

if ask_folder zsh+bash; then
    SRC="zsh+bash"
    sym "$SRC/.bashrc" "$HOME/"
    sym "$SRC/.zshrc" "$HOME/"
    sym "$SRC/.config/shell_profile" "$HOME/.config/"
    sym "$SRC/.config/aliases" "$HOME/.config/"
    sym "$SRC/.config/block.sh" "$HOME/.config/"
    sym "$SRC/.config/welcome" "$HOME/.config/"
fi

if ask_folder vim; then
    SRC="vim"
    sym "$SRC/.vimrc" "$HOME/"
    sym "$SRC/.vim" "$HOME/"
fi

if ask_folder Xresources; then
    SRC="Xresources"
    sym "$SRC/.Xresources" "$HOME/"
fi

if ask_folder vis; then
    SRC="vis"
    sym "$SRC/.config/vis" "$HOME/.config/"
fi

if ask_folder user-dirs; then
    SRC="user-dirs"
    sym "$SRC/.config/user-dirs.dirs" "$HOME/.config/"
fi

if ask_folder neofetch; then
    SRC="neofetch"
    sym "$SRC/.config/neofetch" "$HOME/.config/"
fi

echo
echo Done importing Dotfiles!
echo
