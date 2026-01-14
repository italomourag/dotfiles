#!/bin/bash

pkill dunst
pkill mako

if [ -n "$WAYLAND_DISPLAY" ]; then
    mako &
elif [ -n "$DISPLAY" ]; then
    dunst &
fi
