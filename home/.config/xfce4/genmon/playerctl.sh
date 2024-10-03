#!/bin/bash

status=$(playerctl --ignore-player=chromium,firefox status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    artist=$(playerctl --ignore-player=chromium,firefox metadata artist)
    title=$(playerctl --ignore-player=chromium,firefox metadata title)
    # Play
    echo "<txt>  <span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'>  ▶️  $artist - $title  </span></txt>"
    echo "<tool>$artist - $title</tool>"
elif [ "$status" = "Paused" ]; then
    # Pausa
    echo "<txt>  <span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'>  ⏸️  </span></txt>"
    echo "<tool>Pausado</tool>"
else
    # Stop
    echo "<txt><span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'></span></txt>"
fi