#!/bin/bash
scrot /tmp/lock_screen.png
convert /tmp/lock_screen.png \
    \( -clone 0 -fill "#269cb6" -colorize 70 \) \
    -composite /tmp/lock_tinted.png
betterlockscreen -u /tmp/lock_tinted.png --blur 1.0
betterlockscreen -l blur
