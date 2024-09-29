#!/bin/bash
# changeBrightness

# Arbitrary but unique message tag
msgTag="mybrightness"

# Change the brightness using brightnessctl
brightnessctl set "$@" > /dev/null

# Query brightnessctl for the current brightness level
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

# Check if brightness and max_brightness are valid
if [[ -z "$brightness" || -z "$max_brightness" ]]; then
    dunstify -a "changeBrightness" -u low -i dialog-error "Error: Cannot retrieve brightness"
    exit 1
fi

# Calculate the brightness percentage
percentage=$(( brightness * 100 / max_brightness ))

# Define the icon to use from Papirus
icon="brightness-high-symbolic"  # Substitua pelo ícone desejado

# Show the brightness notification
dunstify -a "changeBrightness" -u low -i "$icon" -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$percentage" "${percentage}%"