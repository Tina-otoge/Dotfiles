#!/bin/sh

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
        mv "$DEST" "$BACKUP_DESTDIR/$DEST_FILE"
    fi
    ln -s $HERESRC $DEST
    echo Symlink: done.
}

if [ -d $BACKUP_DIR ]; then
    echo Backup directory already exists, not creating one...
else
    mkdir $BACKUP_DIR
fi

if ask_folder i3+polybar; then
    SRC="i3+polybar"
    sym "$SRC/.config/fehbg" "$HOME/.config/"
    sym "$SRC/.config/wallpaper.png" "$HOME/.config/"
    sym "$SRC/.config/i3" "$HOME/.config"
    sym "$SRC/.config/polybar" "$HOME/.config"
fi

if ask_folder zsh+bash; then
    SRC="zsh+bash"
    sym "$SRC/.bashrc" "$HOME/"
    sym "$SRC/.zshrc" "$HOME/"
    sym "$SRC/.config/aliases" "$HOME/.config/"
fi

if ask_folder vim; then
    SRC="vim"
    sym "$SRC/.vimrc" "$HOME/"
fi

if ask_folder Xresources; then
    SRC="Xresources"
    sym "$SRC/.Xresources" "$HOME/"
fi

echo
echo Done importing Dotfiles!
echo
