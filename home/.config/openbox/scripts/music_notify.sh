#!/bin/bash

CACHE="$HOME/.cache/dunst-music"
mkdir -p "$CACHE"

NOTIF_ID=9910
last_metadata=""

while read -r _ ; do
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    arturl=$(playerctl metadata mpris:artUrl 2>/dev/null)

    current_metadata="$title - $artist"

    [ -z "$title" ] && continue
    if [ "$current_metadata" = "$last_metadata" ]; then
        continue
    fi

    last_metadata="$current_metadata"
    cover="$CACHE/cover.jpg"

    if [[ "$arturl" == http* ]]; then
        curl -s "$arturl" --output "$cover"
    elif [[ "$arturl" == file://* ]]; then
        cp "${arturl#file://}" "$cover" 2>/dev/null
    else
        rm -f "$cover"
    fi

    notify-send -r "$NOTIF_ID" -i "$cover" "$title" "$artist\n$album"

done < <(playerctl --follow metadata 2>/dev/null)
