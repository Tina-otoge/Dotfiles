#!/bin/bash

link() {
	[ -L "$2" ] && return 0
	ln -sfbv --suffix=.backup "$1" "$2"
}

git submodules update --init

mkdir -p ~/.config
for file in ./*/ ./compton.conf ./picom.conf; do
	link "$file" ~/.config
done
(
	cd
	link .config/vim .vim
	link .config/bash/bashrc .bashrc
	link .config/zsh/zshrc .zshrc
)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
pip install --user thefuck
gsettings set org.gnome.shell.app-switcher current-workspace-only false
gsettings set org.gnome.shell.window-switcher current-workspace-only false
