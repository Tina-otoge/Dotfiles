# My Linux Rice :rice_ball:

## TL;DR
- OS: [Fedora Linux](https://getfedora.org/) [27](https://fedoramagazine.org/announcing-fedora-27/), upgraded from Fedora Linux [26](https://fedoramagazine.org/fedora-26-is-here/) ([Xfce Spin](https://spins.fedoraproject.org/en/xfce/)) :cd:
- WM/DE: [i3](https://i3wm.org/) :computer:
- Terminal: [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) (256 colors) :arrow_forward:
- Font: [Monaco](https://github.com/todylu/monaco.ttf) :capital_abcd:
- Color scheme: Generally monokai or colors from current wallpaper provided by [pywal](https://github.com/dylanaraps/pywal)
- Bars: [polybar](https://github.com/jaagr/polybar) :bar_chart:
- File manager(s): [ranger](https://ranger.github.io/), [Thunar](https://docs.xfce.org/xfce/thunar/start) and [Nautilus](https://wiki.gnome.org/action/show/Apps/Files?action=show&redirect=Apps%2FNautilus) :file_folder:
- Editor: [vim](http://www.vim.org/) with the [molokai](https://github.com/tomasr/molokai) color scheme. :pencil2:
- Music player: [cmus](https://cmus.github.io/) with [cava](http://karlstav.github.io/cava/) as a visualizer and [skielred/bum](https://github.com/skielred/bum) to display album arts :musical_note:

## Screenshots showcase
Just neofetch
![just neofetch](.gh/just-neofetch.png)
Just rofi
![just rofi](.gh/just-rofi.png)
Just vim
![just vim](.gh/just-vim.png)
Just ranger
![just ranger](.gh/just-ranger.png)
cmus, cava and bum
![cmus, cava and bum](.gh/cmus-cava-and-bum.png)

## What's in this repo
- All of my desktop configuration that resides in user land. I basically symlink files from this repo to the correct path and use them exactly like how they are here.
- An installation script for the packages I use if you use Fedora. Just `cd` to this repo after you cloned it somewhere and run `./install_softwares.sh`. It's an interactive script that will introduce every software I use and ask if you want to install them.
- An installation script for the vim plugins I use (suggesting you have a plugin manager, I use [pathogen](https://github.com/tpope/vim-pathogen). Just `cd` to this repo after you cloned it somewhere and run `./vim-plugins.sh`.
- A script to symlink every configuration files from this repo to their corresponding location in your home directory. Makes sure you cloned this repo to a safe and permanent place, maybe fork it, and then `cd` to it and run `./symlink.sh`. The script will ask for confirmation for every folder (neofetch, i3, etc).

## Thanks
Big thanks to [dylanaraps](https://github.com/dylanaraps) for writing neofetch, pywal and bum, and his contributions to rofi.
Thanks to my school mates [Zyrophr](https://github.com/Zyrophr) and [KaZ](https://github.com/Di-KaZ) for joining/forcing me into this stupid ricing thing.

# Help / Q&A
### How do I install i3 ?
```bash
dnf install i3
```

---
### How do I install i3-gaps ?
Either tries a [copr repository](https://copr.fedorainfracloud.org/coprs/fulltext/?fulltext=i3-gaps) or [compile it yourself](https://github.com/Airblader/i3) (this is what I did). The easiest way to avoid dealing with dependencies is to install i3 first, then compile i3-gaps. Then reboot. Congrats you have i3-gaps.

---
### How do I install a copr repository ?
```bash
dnf copr enable thedudewhomadetherepo/therepo
# and
dnf install thepackage
```
Example:
```bash
dnf copr enable frostyx/light && sudo dnf install light
```

---
### How do I install compton ?
I recommend [this copr repository](https://copr.fedorainfracloud.org/coprs/mrbloups/compton/)
```bash
dnf copr enable mrbloups/compton
dnf install compton
```

---
### How do I use a 256 colors vim theme like yours in urxvt
Use the package `rxvt-unicode-256color` (run it with `urxvt256c`).

---
### How do I change the display manager (LightDM, GDM..)
Disable the current one:
```bash
systemctl disable display-manager
```
Then enable the new one. Example with [GDM](https://wiki.gnome.org/Projects/GDM):
```bash
systemctl enable gdm
```

---
### How do I install Discord
I recommend using this script from [RPM-Outpost](https://github.com/RPM-Outpost): [discord](https://github.com/RPM-Outpost/discord)

```bash
dnf install rpm-build

git clone https://github.com/RPM-Outpost/discord && cd discord
./create-package.sh canary

# continually answer "y" to all questions
```

---
More questions? Please [submit an issue](https://github.com/skielred/Dotfiles/issues/new)!
