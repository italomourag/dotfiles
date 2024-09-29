#!/bin/sh

inkscape &
sleep 2;
xdotool search --name "Novo documento 1 - Inkscape" set_window --name "Inkscape"
sleep 2;
xseticon -name Inkscape /usr/share/icons/hicolor/32x32/apps/inkscape.png