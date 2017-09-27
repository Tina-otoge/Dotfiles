# Dotfiles
my dot files

## My setup (Fedora 26)
![preview](https://cdn.discordapp.com/attachments/356776538584121347/359519874961244160/2017-09-19-040325_1920x1080_scrot.png)
- Bars: polybar
- WM: i3(-gaps)
- Editors: vim, atom
- Music player: cmus
- Visualizer: cli-visualizer

Everything to reproduce my setup should be included with this repo except:
- Packages (see `Repos.md` and `packages.txt`)
- Wallpapers (:warning:: background script still try to set background from ~/Pictures/Wallpapers/.../\*, see `i3+polybar/.config/bgloop.sh`

# INSTALLATION (Fedora 26 XFCE, adapt for other distros)

This is a guide to install all the packages I installed on the distribution Fedora 26 + XFCE, distributed by EPITECH in September 2017.

- polybar (bars):
    - Dependencies:  
        `$ sudo dnf install cairo libxcb python2 xcb-proto xcb-util-image xcb-util-wm xcb-util-xrm`
    - Modules dependencies:  
        `$ sudo dnf install i3 wireless-tools-devel alsa-lib libmpdclient-devel libcurl-devel clang`
    - `$ mkdir ~/repos`
    - `$ git clone https://github.com/jaagr/polybar ~/repos/polybar && cd ~/repos/polybar`
    - `$ ./build.sh -f`
    - Press y, again, again and again...
- i3-gaps (Window Manager / Desktop Environment):
    - `$ sudo dnf install i3`
    - Dependencies:  
        `$ sudo dnf install libxcb-devel xcb-util-keysyms-devel xcb-util-devel xcb-util-wm-devel xcb-util-xrm xcb-util-xrm-devel yajl-devel libXrandr-devel startup-notification-devel libev-devel xcb-util-cursor-devel libXinerama-devel libxkbcommon-devel libxkbcommon-x11-devel pcre-devel pango-devel git gcc automake`
    - `$ mkdir ~/repos`
    - `$ git clone https://github.com/Airblader/i3 ~/repos/i3-gaps && cd ~/repos/i3-gaps`
    - `$ autoreconf --force --install`
    - `$ mkdir build && rm -rf build/* && cd build`
    - `$ ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers`
    - `$ make`
    - `$ sudo make install`
- GDM (Desktop Manager, login screen):
    - `$ sudo dnf install gdm`
    - `$ sudo systemctl disable lightdm`
    - `$ sudo systemctl enable gdm`
- zsh (shell):
    - `$ sudo dnf install zsh`
    - `$ chsh -s /bin/zsh`
    - zsh syntax highlighting :  
        `$ sudo dnf install zsh-syntax-highlighting`
- Vivaldi (browser):
    - Visit https://vivaldi.com/download/ and download the RPM file
    - `$ sudo dnf install /path/to/the/vivaldi/rpm/file.rpm`
    - H.264 videos support:  
        `$ cd /tmp`  
        `$ wget https://gist.githubusercontent.com/ruario/bec42d156d30affef655/raw/554c4d81d269137cb008f56dcbd9bfab6a225ba5/latest-proprietary-media.sh`  
        `$ sh latest-proprietary-media.sh`
    - Adobe Flash:  
        Visit https://get.adobe.com/flashplayer/  
        "Select version to download": .rpm for Linux  
        `$ sudo dnf install /path/to/the/flash/rpm/file.rpm`
- feh (image viewer, wallpaper utility):
    - `$ sudo dnf install feh`
- ImageMagick (CLI image editor/converter):
    - `$ sudo dnf install ImageMagick`
- i3lock (screen saver, lock utility):
    - `$ sudo dnf install i3lock`
- scrot (CLI screenshot tool):
    - `$ sudo dnf install scrot`
- light (CLI backlight utility **that works on ThinkPad T470s**)
    - `$ sudo copr enable frostyx/light`
    - `$ sudo dnf install light`
- Discord
    - `$ mkdir ~/repos`
    - `$ git clone https://github.com/RPM-Outpost/discord ~/repos/RPM-discord && cd ~/repos/RPM-discord`
    - `$ ./create-package.sh canary`
- htop (Task manager):
    - `$ sudo dnf install htop`
- neofetch (dickwagging utility):
    - `$ sudo dnf copr enable konimex/neofetch`
    - `$ sudo dnf install neofetch`
- cmus (music player):
    - `$ sudo dnf install cmus`
    
## Dependencies

This is the packages my configuration files require to work

- i3-gaps (i3+polybar)
- polybar (i3+polybar)
- feh (i3+polybar wallpaper)
- ImageMagick (i3+polybar lock.sh)
- i3lock (i3+polybar lock.sh)
- scrot (i3+polybar lock.sh and bindings)
- frostyx/light (i3+polybar bindings)
- rxvt-unicode (i3+polybar bindings)
- htop (i3+polybar bindings)

## My packages
Packages listed here are softwares I use.  
Some of them have configurations included in this repo. Some have not.
- zsh (main shell)
- zsh-syntax-highlighting
- fish (alternative shell)
- ahoviewer (booru browser)
- discord-canary
- vivaldi (main browser)
- vim (main editor)
- atom (alternative editor)
- cli-visualizer
- cmus (main music player)
- htop (main task manager)
- p7zip (main archive manager)
- unrar (alternative archive manager)
- neofetch (main dickwagging)
- python3 (main scripting)
- ocaml (alternative scripting)
- nodejs (alternative scripting)
- mame, wine, mono, rubygems, vlc, lightspark (just in case)
- fortune, lolcat, cowsay, sl (fun)
