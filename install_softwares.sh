#!/usr/bin/bash

CURDIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0))
SCRIPTS="$CURDIR/_scripts"

. "$SCRIPTS/_functions.sh"

clear
echo CAUTION:
echo This script was written for Fedora Linux, it may work on other RPM-based
echo distributions or by aliasing the dnf command to your distribution\'s
echo package manager, however it was only tested and confirmed to work on
echo Fedora 27.
echo
echo Several programs will be presented to you, you will be asked if you want
echo to install them. Entering \"yes\" will proceed with installation. You
echo may be asked for your password to run commands with administrator
echo priviledges. If you are not a sudoer, then run this script as root or
echo from a sudoer account.
echo
echo WARNING:
echo This script INSTALLS the following softwares and then asks if you want to
echo ENABLE them on your system with the DEFAULT settings. It does not use my
echo own settings. If you want to import and use my configuration, see the
echo setup_dotfiles.sh script.
echo
press_any_key

clear
echo "+---------+"
echo "| i3-gaps |"
echo "+---------+"
echo i3 is a window manager. i3 is not a desktop environment.
echo That means it does not come with utilities to use your computer like an
echo internet browser or a file manager. You can however of course still use
echo your own preferred applications and run them from i3. i3 will only acts
echo as a program to manage your windows.
echo What differentiate i3 from other more known window managers is that i3
echo manages your windows as tiles. It does not draw draggable windows on a
echo desktop. It splits your screen in tiles to draw windows in them.
echo i3-gaps is a modified version of i3 that adds some more configuration
echo options, including the ability to add gaps between window.
echo
echo Other popular desktop environments are GNOME, KDE, XFCE \(default on the
echo 2017 EPITECH dump\). Each of them use their own window manager internally.
echo
if $(confirm); then
	sudo dnf copr enable gregw/i3desktop
	sudo dnf install i3-gaps || sudo dnf copr disable gregw/i3desktop
	press_any_key
fi

clear
echo "+-------------------------+"
echo "| rxvt-unicode 256 colors |"
echo "+-------------------------+"
echo rxvt-unicode or URxvt is a terminal emulator. It is based on rxvt, an old
echo terminal emulator fast and robust. Its main additions are the support of
echo unicode characters provided by its multiple fonts system and the support
echo of Perl extensions.
echo It is one of the fastest terminal emulators, it is highly customizable and
echo hackable, it can support drawing images \(pixbuf support\) and can fake
echo transparency by drawing the desktop background behind the text.
echo A build with 256 colors support enables the use of 256 colors theme in
echo CLI editors like emacs or vim or other applications.
echo
if $(confirm); then
	sudo dnf install rxvt-unicode-256color
	press_any_key
fi

clear
echo "+---------+"
echo "| polybar |"
echo "+---------+"
echo NOTE: You may want to use a custom bar only if you do not use a desktop
echo enviroment. For example, if you use i3 or bspwm.
echo
echo A bar is useful to display important informations like the current time,
echo the amount of battery left in the computer, the current state of the CPU
echo and memory usage, the current workspace you are displaying in your window
echo manager, etc.
echo
echo What makes polybar different is that it is easily and highly customizable.
echo It uses the INI file format for its configuration which makes it easy to
echo read and understand.
echo It fetches outputs from scripts to display informations, so you can write
echo your own scripts and easily display their outputs in your bar.
echo
if $(confirm); then
	sudo dnf copr enable ghorhe/polybar
	sudo dnf install polybar || sudo dnf copr disable ghorhe/polybar
	press_any_key
fi

clear
echo "+---------------------------------+"
echo "| GDM (The GNOME Display Manager) |"
echo "+---------------------------------+"
echo A display manager is a program that welcomes you when you boot your OS
echo and asks which account you want to use and the corresponding password if
echo any. The main purpose of a display manager is to let you chose between
echo each desktop environments installed on the computer.
echo
echo GDM is the default display manager for the current main Fedora release.
echo \(LightDM is the default display manager for the 2017 EPITECH dump\)
echo
if $(confirm); then
	sudo dnf install gdm
	if $(confirm "Replace current display manager by gdm?"); then
		sudo systemctl disable display-manager
		sudo systemctl enable gdm
	fi
	press_any_key
fi

clear
echo "+--------+"
echo "| i3lock |"
echo "+--------+"
echo i3lock is a simple screen locker by the makers of i3.
echo It can be customized using command line options and makes it a great
echo choice for users without a desktop environment or who wants to invoke
echo their screen locker in a script.
echo
if $(confirm); then
	sudo dnf install i3lock
	press_any_key
fi

clear
echo "+---------+"
echo "| compton |"
echo "+---------+"
echo Compton is a composite manager / compositor. It draws graphic shaders on
echo the desktop.
echo Common usages are:
echo - Transparency in windows, terminal, context menus, bars
echo - Shadows under windows
echo - Different transparency / shadow for active and inactive windows
echo - Background blur
echo
echo WARNING:
echo A composite manager usually runs ALWAYS while your window manager is open,
echo it can drastically impact the battery usage and I strongly recommend to
echo bind a keys combination to quickly turn it on and off so you can disable
echo it when you don\'t really need it for a long time \(i.e.: watching a movie\).
echo
if $(confirm); then
	sudo dnf copr enable wyvie/compton-master && sudo dnf install compton
	press_any_key
fi

clear
echo "+-------------------+"
echo "| zsh (The Z shell) |"
echo "+-------------------+"
echo A shell is the interface between the user and the OS. It allows the user
echo to interact with the computer, the programs and the files.
echo Most often we use the word shell to describe the interface that runs in a
echo terminal emulator. A program that reads command and execute them.
echo
echo Notable zsh features are:
echo "- Full compatibility with bash, that means everything you already knows"
echo "  still apply to zsh, so you don't have to learn how to use it."
echo "- Lots of features that options, that means that if you don\'t like them"
echo "  you can disable them."
echo "- A \"right prompt\", so you can display informations on the left AND the"
echo "  right."
echo "- TAB completion cycling: press TAB, if there is an ambiguous situation"
echo "  (example you press \"vi\" then TAB, it can means either vi or vim),"
echo "  zsh will cycle through the different options."
echo "- cd expansion: if you are in /var/www/site1/access/log and enters"
echo "  \"cd site1 site2\" you will move to /var/www/site2/access/log, awesome!"
echo "- cd expansion(part.2): if you enter \"cd /v/w/t\" you will move to"
echo "  /var/www/tina immediately, awesome!"
echo
if $(confirm); then
	sudo dnf install zsh
	$(confirm "Makes zsh your default shell ?") && x-terminal-emulator -e chsh -s /usr/bin/zsh
	$(confirm "Installs sqlite ? (Allows for using zsh TAB completion in commands like dnf install)") && sudo dnf install sqlite
	press_any_key
fi

clear
echo "+-------------------------+"
echo "| zsh-syntax-highlighting |"
echo "+-------------------------+"
echo Highlights commands that are valid in green and others in red, before
echo hitting enter. So you know if you mispelled a command without having to
echo hit enter and getting an error.
echo
if $(confirm); then
	sudo dnf install zsh-syntax-highlighting && bash "$SCRIPTS/enable_zsh-sy-hl.sh"
	press_any_key
fi

clear
echo "+----------------+"
echo "| zsh-git-prompt |"
echo "+----------------+"
echo Adds an informative display to the zsh prompt when browsing a git
echo repository. It tells the current branch, the number of modified, staged
echo untracked and conflicting files and the number of diverging commits from
echo the remote.
echo Example:
echo "[tina@trex](master|✚3) % "
echo \(branch is master, 3 modified files\)
echo
if $(confirm); then
	bash "$SCRIPTS/install_zsh-git-prompt.sh"
	press_any_key
fi

clear
echo "+-----+"
echo "| feh |"
echo "+-----+"
echo feh is a very lightweight and simple image viewer for console users.
echo It does not come with a GUI and all actions are controlled by command-line
echo options and configurable mouse/key actions.
echo feh can also be used to set a wallpaper and makes it a common tool for i3
echo and other tiling window managers users who do not want to use a desktop
echo environment.
echo It is also great for users who want to set the wallpaper from a script.
echo
if $(confirm); then
	sudo dnf install feh
	press_any_key
fi


clear
echo "+-------+"
echo "| scrot |"
echo "+-------+"
echo scrot is a command line screenshot tool that supports a variety of options
echo to set a delay before taking a screenshot, to set a thumbnail, or to save
echo the file in a specific folder / with a specific name pattern for example.
echo Blablabla great for i3 and tiling wm users and for scripts.
echo
if $(confirm); then
	sudo dnf install scrot
	press_any_key
fi

clear
echo "+-----------------------+"
echo "| Light (frostyx/light) |"
echo "+-----------------------+"
echo Light is a program to control the backlight. This one has reportedly
echo worked on most systems independently of hardware. It is the first one that
echo I found compatible with my ThinkPad T470s and I strongly recommend to try
echo it if you can not find a backlight utility that works on your hardware.
echo
if $(confirm); then
	sudo dnf copr enable frostyx/light && sudo dnf install light
	press_any_key
fi

clear
echo "+-------------+"
echo "| ImageMagick |"
echo "+-------------+"
echo ImageMagick is a powerful software suite for bitmap image manipulation in
echo a variety of formats. It mainly consists of command line tools.
echo
if $(confirm); then
	sudo dnf install ImageMagick
	press_any_key
fi

# STUFFS THAT IS NOT "NEEDED" TO REPLICATE MY SETUP
clear
echo The following softwares are no longer part of my environment but are part
echo of what I often use. If you only wanted to copy my environment and then
echo start modifying it to make your own and do not care about what I use and
echo how, then I\'d suggest quitting this script and running the
echo setup_dotfiles.sh one.
echo
$(confirm "Exit the script now ?") && exit

clear
echo "+------------+"
echo "| RPM Fusion |"
echo "+------------+"
echo RPM Fusion is repository for RPM-based Linux distributions.
echo It aims to provide packages for softwares that do not comply with the
echo Fedora or Red Had repositories rules.
echo
echo It comes in two flavors and most users install boths.
echo Free: open source softwares
echo Non Free: not open source softwares
echo
if $(confirm "Install RPM Fusion Free ?"); then
	install_rpmfusion_free
	press_any_key
fi
if $(confirm "Install RPM Fusion Non Free ?"); then
	install_rpmfusion_nonfree
	press_any_key
fi

clear
echo "+------+"
echo "| htop |"
echo "+------+"
echo htop is an attempt to make a software that is better than top. It uses
echo ncurses and supports mouse click, scroll, has colors, and lots of display
echo options.
echo
if $(confirm); then
	sudo dnf install htop
	press_any_key
fi

clear
echo "+----------+"
echo "| neofetch |"
echo "+----------+"
echo Neofetch is a system information tool. It displays informations like the
echo OS installed, the CPU and GPU model, the terminal font, etc.
echo Its main use is to add it in a window before taking a screenshot of your
echo desktop so the person receiving it can instantly know what is your system
echo specs without asking you.
echo
if $(confirm); then
	sudo dnf copr enable konimex/neofetch
	sudo dnf install neofetch || sudo dnf copr disable konimex/neofetch
	press_any_key
fi

clear
echo "+-------+"
echo "| p7zip |"
echo "+-------+"
echo 7zip is a free and open source file archiver. p7zip is a port of 7zip for POSIX systems.
echo 7zip has been my file archiver of choice for years mainly for being an
echo open source software. p7zip allows the usage of command line 7zip tools on
echo Linux.
echo
if $(confirm); then
	sudo dnf install p7zip p7zip-plugins
	press_any_key
fi

clear
echo "+---------+"
echo "| thefuck |"
echo "+---------+"
echo A script that corrects your previous command if you type \"fuck\".
echo
if $(confirm); then
	sudo dnf install thefuck
	press_any_key
fi

clear
echo "+------+"
echo "| cmus |"
echo "+------+"
echo cmus or C* Music Player is console music player for UNIX systems made with
echo ncurses. It is simple and lightweight and does not depend on mpd.
echo It supports playlists, has a file browser and vi-like commands.
echo
echo It is available in the RPM Fusion Free repository.
if $(confirm "Install from RPM Fusion ? (This will install RPM Fusion Free is not already installed)"); then
	install_rpmfusion_free
	sudo dnf install cmus
	press_any_key
elif $(confirm "Build and install manually then ?"); then
	bash $SCRIPTS/install_cmus.sh
	press_any_key
fi

clear
echo Wow you actually went through this entirely!
echo I hope I helped you discover some stuffs and that you will enjoy your
echo Linux experience with your newly installed software.
echo Love.
