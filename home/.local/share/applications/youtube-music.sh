#!/bin/sh

youtube-music %U &
sleep 4;
xdotool search --name "Youtube Music" set_window --name "YouTube Music"
sleep 2;
xseticon -name "YouTube Music" /usr/share/icons/hicolor/32x32/apps/youtube-music.png