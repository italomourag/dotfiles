#!/bin/bash

# Ícone para brilho (usando Papirus-Light)
ICON_BRIGHT="/usr/share/icons/Papirus/24x24/symbolic/status/brightness-high-symbolic.svg"

# Notificação de brilho
notify_brightness() {
    local brightness
    brightness=$(brightnessctl get)
    local max
    max=$(brightnessctl max)
    local percent=$(( 100 * brightness / max ))

    notify-send "Brilho" "${percent}%" \
        -i "$ICON_BRIGHT" \
        -h int:value:"$percent" \
        -h string:x-canonical-private-synchronous:brightness
}

# Lógica do script
case "$1" in
    -i|--increase)
        brightnessctl set +5%
        notify_brightness
        ;;
    -d|--decrease)
        brightnessctl set 5%-
        notify_brightness
        ;;
    -s|--status)
        notify_brightness
        ;;
    *)
        echo "Uso: $0 [opção]"
        echo "  -i, --increase    Aumentar brilho"
        echo "  -d, --decrease    Diminuir brilho"
        echo "  -s, --status      Mostrar brilho atual"
        exit 1
        ;;
esac
