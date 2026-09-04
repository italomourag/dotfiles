#!/bin/bash

msgTag="myvolume"

if [[ "$1" == "-d" ]]; then
    pamixer -d 10 > /dev/null
elif [[ "$1" == "-i" ]]; then
    pamixer -i 10 > /dev/null
elif [[ "$1" == "toggle" ]]; then
    pamixer --toggle-mute > /dev/null
fi

volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"

# Gerencia a notificação visual
if [[ "$mute" == "true" || "$volume" -eq 0 ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-muted \
    -h string:x-dunst-stack-tag:$msgTag "Volume mudo"
else
    dunstify -a "changeVolume" -u low -i audio-volume-high \
    -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"
