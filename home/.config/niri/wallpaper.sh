#!/bin/bash
# ~/.config/niri/wallpaper.sh

INTRO="$HOME/.config/niri/arch-intro.png"
WALLPAPER="$HOME/Imagens/.wallpaper.jpg"

# 1. Garante que o daemon está rodando (sem dar pkill para evitar flash)
awww-daemon &
sleep 0.5

# 2. PONTO ZERO: Limpa qualquer imagem anterior com uma cor sólida instantânea
# Isso substitui o seu wallpaper que aparecia "do nada" no início
awww img /dev/null --transition-type none --transition-color "404040"

# 3. FADE DA LOGO DO ARCH (Surgindo do cinza)
# Aumentamos um pouco o duration para o fade ser perceptível
awww img "$INTRO" --transition-type simple --transition-duration 1.5 --transition-fps 60

# 4. PAUSA: Tempo para você ver a logo do Arch Linux
sleep 3.0

# 5. TRANSIÇÃO PARA O SEU WALLPAPER
# Usando o 'wipe' que é a transição mais estável do swww/awww
awww img "$WALLPAPER" --transition-type wipe --transition-angle 30 --transition-duration 1.5 --transition-fps 60

# 6. FINALIZAÇÃO: Aguarda a animação e libera o painel do Quickshell
sleep 1.6
touch /tmp/qs-wallpaper-ready
