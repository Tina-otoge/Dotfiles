# Dotfiles
my dot files

# INSTALLATION (Fedora 26 XFCE, adapt for other distros)
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
(i3-gaps dependencies)
    - `$ mkdir ~/repos`
    - `$ git clone https://github.com/Airblader/i3 ~/repos/i3-gaps && $ cd ~/repos/i3-gaps`
    - `$ autoreconf --force --install`
    - `$ mkdir build && rm -rf build/* && cd build`
    - `$ ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers`
    - `$ make`
    - `$ sudo make install`
- GDM (Desktop Manager, login screen):
    - `$ sudo dnf install gdm`
    - `$ sudo systemctl disable lightdm`
    - `$ sudo systemctl enable gdm`
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
    


## KEEPING THE OS BLINUX FRIENDLY
My configuration tries to keep the OS behavior similar to blinux for compiling / rendering solutions.  
Since I have not yet fiddled with blinux, it is not currently the case.  
However here are 2 important RPM-based distributions commands that might help :  
- `$ dnf install package-v.e.r-sion.fcXX`: installs specific version of package
- `exclude=package_name package_pattern-*` in `/etc/dnf/dnf.conf`: exclude packages from updating

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

## Dependencies
- i3-gaps (i3+polybar)
- polybar (i3+polybar)
- feh (i3+polybar wallpaper)
- ImageMagick (i3+polybar lock.sh)
- i3lock (i3+polybar lock.sh)
- scrot (i3+polybar lock.sh and bindings)
- light (i3+polybar bindings)
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
