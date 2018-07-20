#!/usr/bin/env bash

killall mpv mplayer guake compton
guake --hide &
compton -b
# videobg ~/Pictures/Wallpapers/nier_menu_loop.mp4 &
