#!/usr/bin/env bash

theme=Monokai.theme
folder=$(dirname $0)
xrdb -merge $folder/$theme
xrdb -merge $folder/keys.theme
xrdb -merge $folder/extra.theme
rofi -show combi -combi-modi run,drun,window -modi combi,window,drun,run
