#!/bin/bash
DESKTOP="${XDG_CURRENT_DESKTOP:-}"
SESSION="${DESKTOP_SESSION:-}"
if [[ "$DESKTOP" == *"KDE"* ]] || [[ "$SESSION" == *"plasma"* ]]; then
    exit 0
fi

MODE=$(cat ~/.config/openbox/theme-mode 2>/dev/null || echo "dark")
ICON_SET="Papirus-Dark"
[ "$MODE" = "light" ] && ICON_SET="Papirus-Light"

STATE_FILE="/tmp/.last_ac_state"
AC=$(cat /sys/class/power_supply/AC*/online 2>/dev/null)
BAT=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -n1)

if [ "$AC" -eq 1 ]; then
    TITLE="Conectado na tomada"
    MESSAGE="Performance"
    ICON="/usr/share/icons/$ICON_SET/16x16/panel/battery-100-charging-profile-performance.svg"
else
    TITLE="Conectado na bateria (${BAT}%)"
    MESSAGE="Economia de energia"
    ICON="/usr/share/icons/$ICON_SET/16x16/panel/battery-100-charging-profile-powersave.svg"
fi

if [ ! -f "$STATE_FILE" ]; then
    echo "$AC" > "$STATE_FILE"
    notify-send -i "$ICON" "$TITLE" "$MESSAGE"
    exit 0
fi

LAST=$(cat "$STATE_FILE")
if [ "$AC" != "$LAST" ]; then
    echo "$AC" > "$STATE_FILE"
    notify-send -i "$ICON" "$TITLE" "$MESSAGE"
fi
