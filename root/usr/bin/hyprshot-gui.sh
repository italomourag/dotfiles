#!/bin/bash

OPTION=()

values=$(zenity \
    --title="Hyprshot" \
    --text="Opções" \
    --forms \
    --add-combo="Modo (padrão: Tela Inteira)" \
    --combo-values="Tela inteira | Janela específica | Área específica" \
    --add-entry="Tempo de espera (Padrão: 0s)" \
    --add-combo="Área de transferência e arquivo / Apenas área de transferência" \
    --combo-values="Monitor (Tela inteira)" \
    --add-combo="Diretório" \
    --combo-values="$(hyprctl -j monitors | jq -r 'map(.name) | join("|")')" \
    --add-combo="Diretório da captura de tela" \
    --combo-values="~/Desktop/|Selecionar diretório" \
) 2>/dev/null

result=$?

mode=$(echo $values | cut -d '|' -f 1)
wait=$(echo $values | cut -d '|' -f 2)
clipboard=$(echo $values | cut -d '|' -f 3)
monitor=$(echo $values | cut -d '|' -f 4)
directory=$(echo $values | cut -d '|' -f 5)

if [ "$result" -eq 1 ]; then  # select cancel
    echo "Cancelled"
    exit
fi

if [ "$directory" == "Selecionar diretório" ]; then
    FILEDIR=$(zenity --file-selection --directory --title="Escolher diretório para salvar captura de tela")

    if [ "$?" -eq 1 ]; then
        FILEDIR="$HOME/Desktop"
    fi
else
    FILEDIR="$HOME/Desktop"
fi


if [ ! -z "$wait" ]; then
    sleep $wait
fi

FILENAME="Screenshot_$(date +%F_%H.%M.%S).png"

if [ "$mode" == "Janela específica" ]; then
    MODE_OPTION="-m window"
elif [ "$mode" == "Área específica" ]; then
    MODE_OPTION="-m region"
else
    MODE_OPTION="-m output"
fi

if [ ! -z "$monitor" ]; then
    MODE_OPTION+=(" -m $monitor")
fi


if [ "$clipboard" == "Apenas área de transferência" ]; then
    hyprshot $MODE_OPTION --clipboard-only
else
    hyprshot $MODE_OPTION -o $FILEDIR -f $FILENAME
fi