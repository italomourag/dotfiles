#!/bin/bash

CACHE="$HOME/.cache/dunst-music"
mkdir -p "$CACHE"

# ID fixo para a notificação de música (evita pilhas de janelas)
NOTIF_ID=9910
last_metadata=""

# Usamos redirecionamento < <(...) para evitar subshell e manter as variáveis vivas
while read -r _ ; do
    # Pegamos os dados de uma vez para evitar múltiplas chamadas ao playerctl
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    arturl=$(playerctl metadata mpris:artUrl 2>/dev/null)

    # Criamos uma string única para comparar (título + artista)
    current_metadata="$title - $artist"

    # Se nada mudou ou o título está vazio, ignora
    [ -z "$title" ] && continue
    if [ "$current_metadata" = "$last_metadata" ]; then
        continue
    fi

    last_metadata="$current_metadata"
    cover="$CACHE/cover.jpg"

    # Baixa ou copia a capa
    if [[ "$arturl" == http* ]]; then
        curl -s "$arturl" --output "$cover"
    elif [[ "$arturl" == file://* ]]; then
        cp "${arturl#file://}" "$cover" 2>/dev/null
    else
        # Caso não tenha capa, remove a antiga para não mostrar a música anterior
        rm -f "$cover"
    fi

    # Envia a notificação substituindo a anterior (graças ao -r)
    notify-send -r "$NOTIF_ID" -i "$cover" "$title" "$artist\n$album"

done < <(playerctl --follow metadata 2>/dev/null)
