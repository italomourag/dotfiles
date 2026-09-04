#!/bin/bash
result=$(~/.config/conky/bt_battery.sh)
[[ -z "$result" ]] && exit 0

name=$(echo "$result" | cut -d'|' -f1)
bat=$(echo "$result" | cut -d'|' -f2)

if (( bat < 20 )); then
    echo "BT \${color #ff4444}${name} \${alignr}${bat}% \${color #ff4444}\${execbar 4,50 echo ${bat}}\${color}"
else
    echo "BT \${color}${name} \${alignr}${bat}% \${color1}\${execbar 4,50 echo ${bat}}\${color}"
fi
