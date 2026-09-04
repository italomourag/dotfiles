#!/bin/bash
koreader "$@" &

SCREEN_W=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -dx -f1)
SCREEN_H=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -dx -f2)
WIN_W=800
WIN_H=600
X=$(( (SCREEN_W - WIN_W) / 2 ))
Y=$(( (SCREEN_H - WIN_H) / 2 ))

for i in {1..5}; do
  sleep 0.5
  WID=$(xdotool search --class "luajit" 2>/dev/null | head -1)
  [ -n "$WID" ] && xdotool windowmove $WID $X $Y
done
