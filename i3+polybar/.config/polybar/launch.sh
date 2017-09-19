#!/usr/bin/env sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar top &
polybar bottom &
if (xrandr | grep 'HDMI-2 connected' >/dev/null); then
    polybar hdmi2 &
fi
