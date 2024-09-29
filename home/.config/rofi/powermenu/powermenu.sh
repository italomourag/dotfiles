#!/usr/bin/env bash

# Autor : Aditya Shakya (adi1090x)
# Github : @adi1090x
# Modificado : italomourag
#
# X11 : betterlockscreen
# Wayland : hyprlock

dir="$HOME/.config/rofi/powermenu/"
theme='config'

shutdown=''
reboot=''
lock=''
logout=''

rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${theme}.rasi
}

run_rofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--logout' ]]; then
		if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
			hyprctl dispatch exit
		elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
			bspc quit
		elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
			i3-msg exit
		elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
			qdbus org.kde.ksmserver /KSMServer logout 0 0 0
		fi
	fi
}

chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
if [[ $XDG_SESSION_TYPE == "x11" && -x '/usr/bin/betterlockscreen' ]]; then
    betterlockscreen -l
elif [[ $XDG_SESSION_TYPE == "wayland" && -x '/usr/bin/hyprlock' ]]; then
    hyprlock
fi
        ;;
    $logout)
		run_cmd --logout
        ;;
esac