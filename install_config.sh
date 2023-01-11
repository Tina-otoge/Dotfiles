#!/bin/bash

link() {
	[ -L "$2" ] && return 0
	ln -sfbv --suffix=.backup "$1" "$2"
}

git submodule update --init

mkdir -p ~/.config
for file in ./*/ ./*.conf; do
	link "$(realpath "$file")" ~/.config
done
(
	cd
	link .config/vim .vim
	link .config/bash/bashrc .bashrc
	link .config/zsh/zshrc .zshrc
)
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# pip install --user thefuck
gsettings set org.gnome.shell.app-switcher current-workspace-only false
gsettings set org.gnome.shell.window-switcher current-workspace-only false
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
