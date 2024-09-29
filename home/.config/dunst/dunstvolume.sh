#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using pamixer
if [[ "$1" == "-d" ]]; then
    pamixer -d 10 > /dev/null  # Diminuir volume
elif [[ "$1" == "-i" ]]; then
    pamixer -i 10 > /dev/null  # Aumentar volume
elif [[ "$1" == "toggle" ]]; then
    pamixer --toggle-mute > /dev/null  # Alternar mudo
fi

# Query pamixer for the current volume and whether or not the speaker is muted
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"

if [[ "$mute" == "true" || "$volume" -eq 0 ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
