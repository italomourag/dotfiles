#!/bin/bash
VIDEO="/home/ito/.config/openbox/scripts/splash_light.mp4"

if [ ! -f "$VIDEO" ]; then
    exit 1
fi

wait_for_x11() {
    local timeout=10
    local elapsed=0
    while ! xdpyinfo >/dev/null 2>&1; do
        sleep 0.3
        elapsed=$((elapsed + 1))
        [ $elapsed -ge $((timeout * 5)) ] && return 1
    done
    return 0
}

wait_for_x11

while ! pgrep -x "openbox" > /dev/null; do
    sleep 0.3
done

timeout=15
elapsed=0
while ! wmctrl -m 2>/dev/null | grep -qi "openbox"; do
    sleep 0.3
    elapsed=$((elapsed + 1))
    [ $elapsed -ge $((timeout * 5)) ] && break
done

sleep 0.5

mpv --fullscreen \
    --vo=x11 \
    --no-audio \
    --no-osc \
    --no-osd-bar \
    --no-input-default-bindings \
    --no-border \
    --ontop \
    --loop-file=no \
    --keepaspect=no \
    "$VIDEO"

exit 0
