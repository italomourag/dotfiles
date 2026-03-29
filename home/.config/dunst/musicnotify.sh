#!/bin/bash

CACHE="$HOME/.cache/dunst-music"
mkdir -p "$CACHE"

last_title=""

playerctl --follow metadata 2>/dev/null | while read -r _; do
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    arturl=$(playerctl metadata mpris:artUrl 2>/dev/null)

    [ -z "$title" ] && continue

    # Evita notificação repetida
    if [ "$title" = "$last_title" ]; then
        continue
    fi
    last_title="$title"

    cover="$CACHE/cover.jpg"

    # Baixa capa
    if [[ "$arturl" == http* ]]; then
        curl -s "$arturl" --output "$cover"
    elif [[ "$arturl" == file://* ]]; then
        cp "${arturl#file://}" "$cover" 2>/dev/null
    fi

    notify-send \
        -i "$cover" \
        "$title" \
        "$artist\n$album"
done
