#!/bin/bash

# Verifica o status do player (se está tocando ou pausado)
status=$(playerctl status 2>/dev/null)

# Se estiver tocando, exibe a música e o artista
if [ "$status" = "Playing" ]; then
    artist=$(playerctl metadata artist)
    title=$(playerctl metadata title)
    echo "<txt>  <span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'>  ▶️  $artist - $title  </span></txt>"
    echo "<tool>$artist - $title</tool>"
elif [ "$status" = "Paused" ]; then
    # Exibe pausa
    echo "<txt>  <span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'>  ⏸️  </span>  </txt>"
    echo "<tool>Pausado</tool>"
else
    # Exibe ícone de stop
    echo "<txt><span background='#444444' foreground='#e7e8eb' font_family='Roboto' font_weight='bold'></span></txt>"
    echo "<tool>Nenhuma música tocando</tool>"
fi