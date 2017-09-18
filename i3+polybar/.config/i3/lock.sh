#!/bin/bash

scrot -e 'mv $f /tmp/bg.png'
convert /tmp/bg.png -blur 10x15 /tmp/bg-blur.png
i3lock -n -f -i /tmp/bg-blur.png
