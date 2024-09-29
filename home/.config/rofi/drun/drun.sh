#!/usr/bin/env bash

# Autor : Aditya Shakya (adi1090x)
# Github : @adi1090x
# Modificado : italomourag

dir="$HOME/.config/rofi/drun/"
theme='config'

rofi_cmd() {
        rofi -modi drun -show drun -line padding 4 -hide-scrollbar -show-icons \
		-theme ${dir}/${theme}.rasi
}

rofi_cmd