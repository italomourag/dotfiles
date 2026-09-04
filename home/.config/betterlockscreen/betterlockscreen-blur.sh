#!/bin/bash

playerctl pause
scrot -o /tmp/screen.png
convert /tmp/screen.png \
    -blur 0x8 \
    \( -clone 0 -fill "#1e1e1e" -colorize 80 \) \
    -composite /tmp/lock_final.png
betterlockscreen -u /tmp/lock_final.png
betterlockscreen -l
