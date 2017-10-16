#!/usr/bin/env bash

echo === sakura ===
while [ $(pidof oneko | wc -w) != 0 ]; do
    echo An instance of oneko found, kill with SIGSYS !!
    pkill --signal 31 -f oneko;
    sleep 2
done
while [ $(pidof oneko | wc -w) != 1 ]; do
    echo Invoking sakura !
    nice -n 19 oneko -sakura -fg pink -bg '#222' -position +9-6
    sleep 2
done
echo done !
echo ===   End  ===
