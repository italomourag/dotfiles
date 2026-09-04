#!/bin/bash

msgTag="mybrightness"

brightnessctl set "$@" > /dev/null

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

if [[ -z "$brightness" || -z "$max_brightness" ]]; then
    dunstify -a "changeBrightness" -u low -i dialog-error "Error: Cannot retrieve brightness"
    exit 1
fi

percentage=$(( brightness * 100 / max_brightness ))

icon="brightnesssettings"

dunstify -a "changeBrightness" -u low -i "$icon" -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$percentage" "${percentage}%"
