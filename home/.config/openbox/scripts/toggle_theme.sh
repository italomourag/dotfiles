#!/usr/bin/env bash
# toggle_theme.sh — dark/light toggle para Openbox

# Configuração de temas
KV_DARK="MateriaDark"
KV_LIGHT="MateriaLight"

QT_ICON_DARK="Papirus-Dark"
QT_ICON_LIGHT="Papirus-Light"

GTK_ICON_DARK="Papirus-Dark"
GTK_ICON_LIGHT="Papirus-Light"

OB_THEME_DARK="Materia Dark"
OB_THEME_LIGHT="Materia Light"

STARTPAGE="https://italomourag.github.io/startpage/"
THEME_FILE="$HOME/.config/openbox/scripts/theme-mode"

# Detecta modo atual
CURRENT=$(grep -oP '(?<=^theme=).*' ~/.config/Kvantum/kvantum.kvconfig | head -1)

if [[ "$CURRENT" == "$KV_DARK" ]]; then
    MODE="light"
    KV_THEME="$KV_LIGHT"
    QT_ICON="$QT_ICON_LIGHT"
    GTK_ICON="$GTK_ICON_LIGHT"
    OB_THEME="$OB_THEME_LIGHT"
    COLOR_SCHEME="prefer-light"
    DARK_PREF=0
    PANEL_DARK="false"
    WALLPAPER_COLOR="#cecece"
else
    MODE="dark"
    KV_THEME="$KV_DARK"
    QT_ICON="$QT_ICON_DARK"
    GTK_ICON="$GTK_ICON_DARK"
    OB_THEME="$OB_THEME_DARK"
    COLOR_SCHEME="prefer-dark"
    DARK_PREF=1
    PANEL_DARK="true"
    WALLPAPER_COLOR="#253034"
fi

echo "Aplicando modo: $MODE"
echo "$MODE" > "$THEME_FILE"

# Wallpaper - transição automática. A janela é POPUP (override-redirect),
# então fica garantidamente acima do xfce4-panel por protocolo X11 — não
# precisa esconder/matar o panel pra nada.
python3 ~/.config/openbox/scripts/wallpaper_transition.py "$WALLPAPER_COLOR" "$MODE" &
TRANSITION_PID=$!
sleep 1.2
nitrogen --set-zoom-fill "$HOME/Imagens/.wallpaper_${MODE}.jpg"

# Kvantum
sed -i "s/^theme=.*/theme=$KV_THEME/" ~/.config/Kvantum/kvantum.kvconfig

# Zera sombra de menu nos dois temas
sed -i 's/^menu_shadow_depth=.*/menu_shadow_depth=0/' \
    ~/.config/Kvantum/MateriaDark/MateriaDark.kvconfig
sed -i 's/^menu_shadow_depth=.*/menu_shadow_depth=0/' \
    ~/.config/Kvantum/MateriaLight/MateriaLight.kvconfig

# Qt6ct
sed -i "s/^icon_theme=.*/icon_theme=$QT_ICON/" ~/.config/qt6ct/qt6ct.conf

# GTK3/4
for GTK_DIR in ~/.config/gtk-3.0 ~/.config/gtk-4.0; do
    sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$DARK_PREF/" \
        "$GTK_DIR/settings.ini"
    sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$GTK_ICON/" \
        "$GTK_DIR/settings.ini"
done

# GTK2
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$GTK_ICON\"/" \
    ~/.gtkrc-2.0.mine
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$GTK_ICON\"/" \
    ~/.gtkrc-2.0

# Gsettings
gsettings set org.gnome.desktop.interface icon-theme "$GTK_ICON"
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"

# Xsettingsd
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"Materia-compact\"/" \
    ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$GTK_ICON\"/" \
    ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Gtk\/ApplicationPreferDarkTheme.*/Gtk\/ApplicationPreferDarkTheme $DARK_PREF/" \
    ~/.config/xsettingsd/xsettingsd.conf
pkill xsettingsd; xsettingsd &

# Conky
if [[ "$MODE" == "dark" ]]; then
    cp ~/.config/conky/conky_dark.conf ~/.config/conky/conky.conf
else
    cp ~/.config/conky/conky_light.conf ~/.config/conky/conky.conf
fi
pkill conky; conky &

# Openbox
sed -i '45s|<name>.*</name>|<name>'"$OB_THEME"'</name>|' ~/.config/openbox/rc.xml
openbox --reconfigure

# Xconf / Xfce4-panel (config gravada aqui; panel ainda está fechado)
if [[ "$MODE" == "dark" ]]; then
    cp ~/.config/gtk-3.0/gtk_dark.css ~/.config/gtk-3.0/gtk.css
else
    cp ~/.config/gtk-3.0/gtk_light.css ~/.config/gtk-3.0/gtk.css
fi

xfconf-query -c xsettings -p /Net/IconThemeName -s "$GTK_ICON"
xfconf-query -c xfce4-panel -p /panels/dark-mode -s "$PANEL_DARK"
xfce4-panel -r &

# Nm-applet
dunstctl set-paused true
pkill nm-applet; nm-applet &
sleep 2

# Dunst
if [[ "$MODE" == "dark" ]]; then
    cp ~/.config/dunst/dunstrc_dark ~/.config/dunst/dunstrc
else
    cp ~/.config/dunst/dunstrc_light ~/.config/dunst/dunstrc
fi
pkill dunst; dunst &

# Plasma — esquema de cores (para Kirigami/Spectacle)
if [[ "$MODE" == "dark" ]]; then
    plasma-apply-colorscheme MateriaDark
else
    plasma-apply-colorscheme MateriaLight
fi

# LibreOffice — ícones Breeze
if ! pgrep -f soffice &>/dev/null; then
    if [[ "$MODE" == "dark" ]]; then
        sed -i 's|<prop oor:name="SymbolStyle" oor:op="fuse"><value>.*</value></prop>|<prop oor:name="SymbolStyle" oor:op="fuse"><value>breeze_dark</value></prop>|' \
            ~/.config/libreoffice/4/user/registrymodifications.xcu
    else
        sed -i 's|<prop oor:name="SymbolStyle" oor:op="fuse"><value>.*</value></prop>|<prop oor:name="SymbolStyle" oor:op="fuse"><value>breeze</value></prop>|' \
            ~/.config/libreoffice/4/user/registrymodifications.xcu
    fi
fi

# O overlay já terminou o fade-in e está segurando a tela coberta,
# esperando o sinal. Com tudo modificado (panel incluso, restart lá
# em cima já rodou escondido atrás do overlay), avisa pra começar o
# fade-out e espera ele se autodestruir.
kill -USR1 $TRANSITION_PID 2>/dev/null
wait $TRANSITION_PID 2>/dev/null

echo "Tema $MODE aplicado."
