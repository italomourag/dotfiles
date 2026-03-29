#!/bin/bash

VIDEO="/home/ito/.config/openbox/wallpaper-arch.mp4"

if [ ! -f "$VIDEO" ]; then
    nitrogen --restore 2>/dev/null &
    exit 1
fi

# Função para aguardar o X11 estar pronto
wait_for_x11() {
#local timeout=10
    local timeout=10
    local elapsed=0
    while ! xdpyinfo >/dev/null 2>&1; do
        sleep 0.2
        elapsed=$((elapsed + 1))
        if [ $elapsed -ge $((timeout * 5)) ]; then
            return 1
        fi
    done
    return 0
}

# Aguarda o X11 estar pronto
wait_for_x11

# Aguarda o Openbox carregar (mais confiável)
#sleep 2
sleep 2

# Verifica se o Openbox já está rodando
while ! pgrep -x "openbox" > /dev/null; do
    sleep 0.2
done

# Pequena pausa extra para garantir
sleep 0.5

# Inicia o vídeo em tela cheia
mpv --fullscreen \
    --vo=x11 \
    --no-audio \
    --no-osc \
    --no-osd-bar \
    --no-input-default-bindings \
    --loop-file=no \
    --keepaspect=no \
    "$VIDEO" &

MPV_PID=$!

# Pequeno delay para o vídeo iniciar
sleep 0.5

# Carrega o wallpaper por trás
nitrogen --restore 2>/dev/null &

# Aguarda o vídeo terminar (6 segundos)
sleep 6

# Mata o mpv
if kill -0 $MPV_PID 2>/dev/null; then
    kill $MPV_PID
fi

exit 0
