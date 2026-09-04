#!/bin/bash
device=$(bluetoothctl info 2>/dev/null)
name=$(echo "$device" | grep "Name:" | sed 's/.*Name: //' | tr -d '\t')
bat=$(echo "$device" | grep "Battery Percentage" | grep -oP '\(\K\d+(?=\))')

if [[ -n "$name" && -n "$bat" ]]; then
    echo "${name}|${bat}"
fi
