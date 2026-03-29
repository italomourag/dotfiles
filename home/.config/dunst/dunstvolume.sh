#!/bin/bash
/* Script para alterar volume com notificações Dunst */

# Tag de mensagem única e arbitrária
msgTag="myvolume"

/* Altera o volume usando o pamixer */
if [[ "$1" == "-d" ]]; then
    pamixer -d 10 > /dev/null  # Diminuir volume
elif [[ "$1" == "-i" ]]; then
    pamixer -i 10 > /dev/null  # Aumentar volume
elif [[ "$1" == "toggle" ]]; then
    pamixer --toggle-mute > /dev/null  # Alternar mudo
fi

# Consulta o pamixer para obter o volume atual e o estado do mudo
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"

/* Gerencia a notificação visual */
if [[ "$mute" == "true" || "$volume" -eq 0 ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-muted \
    -h string:x-dunst-stack-tag:$msgTag "Volume mudo"
else
    dunstify -a "changeVolume" -u low -i audio-volume-high \
    -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Toca o som de alteração de volume
canberra-gtk-play -i audio-volume-change -d "changeVolume"
