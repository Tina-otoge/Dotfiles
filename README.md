# Dotfiles
my dot files

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
