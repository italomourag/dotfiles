#!/bin/bash
bat=$1
num=${bat//BAT/}
status=$(cat /sys/class/power_supply/${bat}/status 2>/dev/null)
result=$(acpi -b | grep "Battery ${num}:" | grep -oP '\d+:\d+:\d+')

if [[ "$status" == "Discharging" ]]; then
    [[ -n "$result" ]] && echo "/ $result -" || echo ""
elif [[ "$status" == "Charging" ]]; then
    [[ -n "$result" ]] && echo "/ $result +" || echo ""
elif [[ "$status" == "Full" ]]; then
    echo "/ ="
else
    echo ""
fi
