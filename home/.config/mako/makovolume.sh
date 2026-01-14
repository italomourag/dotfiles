#!/bin/bash

# Ícones do Papirus-Light
ICON_VOL_HIGH="/usr/share/icons/Papirus-Light/22x22/panel/volume-level-high.svg"
ICON_VOL_LOW="/usr/share/icons/Papirus-Light/22x22/panel/volume-level-low.svg"
ICON_VOL_MUTE="/usr/share/icons/Papirus-Light/22x22/panel/volume-level-muted.svg"

ICON_MIC_ON="/usr/share/icons/Papirus-Light/22x22/panel/microphone-sensitivity-high.svg"
ICON_MIC_MUTE="/usr/share/icons/Papirus-Light/22x22/panel/microphone-sensitivity-muted.svg"

# Notificação do volume do sistema
notify_volume() {
    local vol
    vol=$(pamixer --get-volume)

    if pamixer --get-mute | grep -q true; then
        notify-send "Volume" "" \
            -i "$ICON_VOL_MUTE" \
            -h int:value:0 \
            -h string:x-canonical-private-synchronous:volume
    elif [ "$vol" -lt 30 ]; then
        notify-send "Volume" "${vol}%" \
            -i "$ICON_VOL_LOW" \
            -h int:value:"$vol" \
            -h string:x-canonical-private-synchronous:volume
    else
        notify-send "Volume" "${vol}%" \
            -i "$ICON_VOL_HIGH" \
            -h int:value:"$vol" \
            -h string:x-canonical-private-synchronous:volume
    fi
}

# Notificação do microfone
notify_mic() {
    if pamixer --default-source --get-mute | grep -q true; then
        notify-send "Microfone" "Mutado" \
            -i "$ICON_MIC_MUTE" \
            -h string:x-canonical-private-synchronous:mic
    else
        vol=$(pamixer --default-source --get-volume)
        notify-send "Microfone" "${vol}%" \
            -i "$ICON_MIC_ON" \
            -h int:value:"$vol" \
            -h string:x-canonical-private-synchronous:mic
    fi
}

# Lógica do script
case "$1" in
    -i|--increase)
        pamixer --increase 5
        notify_volume
        ;;
    -d|--decrease)
        pamixer --decrease 5
        notify_volume
        ;;
    -m|--mute)
        pamixer --toggle-mute
        notify_volume
        ;;
    -mm|--mic-mute)
        pamixer --default-source --toggle-mute
        notify_mic
        ;;
    -mi|--mic-info)
        notify_mic
        ;;
    *)
        echo "Uso: $0 [opção]"
        echo "  -i,  --increase      Aumentar volume"
        echo "  -d,  --decrease      Diminuir volume"
        echo "  -m,  --mute          Alternar mute de áudio"
        echo "  -mm, --mic-mute      Alternar mute do microfone"
        echo "  -mi, --mic-info      Mostrar status do microfone"
        exit 1
        ;;
esac
