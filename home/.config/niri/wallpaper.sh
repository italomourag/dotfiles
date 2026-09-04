#!/bin/bash
# ~/.config/niri/wallpaper.sh

INTRO="$HOME/.config/niri/arch-intro.png"
WALLPAPER="$HOME/Imagens/.wallpaper_dark.jpg"

awww-daemon &
sleep 0.5
awww img /dev/null --transition-type none --transition-color "404040"
awww img "$INTRO" --transition-type simple --transition-duration 1.5 --transition-fps 60
sleep 3.0
awww img "$WALLPAPER" --transition-type wipe --transition-angle 30 --transition-duration 1.5 --transition-fps 60
sleep 1.6
touch /tmp/qs-wallpaper-ready
