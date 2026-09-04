#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib
import cairo
import math
import sys
import time
import signal
import threading

# Define um WM_CLASS fixo (útil pra depuração/identificação da janela).
GLib.set_prgname("theme-transition-overlay")

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) / 255.0 for i in (0, 2, 4))

def lerp_rgb(c1, c2, t):
    t = max(0.0, min(1.0, t))
    return tuple(c1[i] + (c2[i] - c1[i]) * t for i in range(3))

color_hex = sys.argv[1] if len(sys.argv) > 1 else "#000000"
mode      = sys.argv[2] if len(sys.argv) > 2 else "dark"
r, g, b = hex_to_rgb(color_hex)

FADE_IN_DURATION  = 1
FADE_OUT_DURATION = 1
# Segurança: se por algum motivo o sinal nunca chegar (script travou,
# esqueceram de mandar, etc.), começa o fade-out sozinho depois disso
# pra não deixar a tela coberta pra sempre.
MAX_HOLD = 15
STEPS    = 60

# Spinner — anel circular com uma parte vazada, girando
SPIN_TICK_MS       = 16     # ~60fps, giro suave
SPIN_SPEED         = 0.28   # rad por tick — rotação rápida
RADIUS_RATIO       = 0.028  # relativo ao menor lado da tela
LINE_WIDTH_RATIO   = 0.35   # relativo ao raio
ARC_FRACTION       = 0.72   # quanto do círculo é "traço" (resto é gap)

# Cor do spinner migra do cinza-claro pro escuro (mudando pra dark)
# ou do escuro pro cinza-claro (mudando pra light), enquanto gira.
GRAY_LIGHT = hex_to_rgb("#e8e8e8")
GRAY_DARK  = hex_to_rgb("#3a3a3a")
if mode == "dark":
    SPINNER_START, SPINNER_END = GRAY_LIGHT, GRAY_DARK   # claro -> escuro
else:
    SPINNER_START, SPINNER_END = GRAY_DARK, GRAY_LIGHT   # escuro -> claro

COLOR_TRANSITION_DURATION = 2.0  # segundos pra completar a migração de cor
COLOR_STEP = (SPIN_TICK_MS / 1000.0) / COLOR_TRANSITION_DURATION

opacity        = [0.0]
color_progress = [0.0]
spin_angle     = [0.0]
ready_to_fade_out = threading.Event()

win = Gtk.Window(type=Gtk.WindowType.POPUP)
win.set_app_paintable(True)
screen = Gdk.Screen.get_default()
win.set_default_size(screen.get_width(), screen.get_height())
win.move(0, 0)
visual = screen.get_rgba_visual()
if visual:
    win.set_visual(visual)

def draw_spinner(cr, widget):
    w = widget.get_allocated_width()
    h = widget.get_allocated_height()
    cx, cy = w / 2.0, h / 2.0
    radius = min(w, h) * RADIUS_RATIO
    line_w = radius * LINE_WIDTH_RATIO

    cur_color = lerp_rgb(SPINNER_START, SPINNER_END, color_progress[0])

    start_angle = spin_angle[0]
    end_angle = start_angle + (2 * math.pi * ARC_FRACTION)

    cr.set_line_width(line_w)
    cr.set_line_cap(cairo.LINE_CAP_ROUND)
    cr.set_source_rgba(cur_color[0], cur_color[1], cur_color[2], opacity[0])
    cr.arc(cx, cy, radius, start_angle, end_angle)
    cr.stroke()

def on_draw(widget, cr):
    cr.set_source_rgba(r, g, b, opacity[0])
    cr.paint()
    draw_spinner(cr, widget)
    return False

win.connect('draw', on_draw)

def tick_spinner():
    spin_angle[0] = (spin_angle[0] + SPIN_SPEED) % (2 * math.pi)
    if color_progress[0] < 1.0:
        color_progress[0] = min(1.0, color_progress[0] + COLOR_STEP)
    win.queue_draw()
    return True  # continua rodando

spin_timer_id = GLib.timeout_add(SPIN_TICK_MS, tick_spinner)

def on_destroy(widget):
    GLib.source_remove(spin_timer_id)
    Gtk.main_quit()

win.connect('destroy', on_destroy)

# Janela POPUP (override-redirect) já é garantida pelo protocolo X11
# como sempre acima de qualquer janela gerenciada pelo WM — inclusive
# docks/painéis — então não precisa de keep_above/stick/hints de WM.
win.show_all()

def on_sigusr1():
    ready_to_fade_out.set()
    return GLib.SOURCE_REMOVE

# GLib.unix_signal_add integra o sinal direto no loop do GLib/Gtk,
# entregue de forma confiável mesmo com Gtk.main() rodando.
GLib.unix_signal_add(GLib.PRIORITY_DEFAULT, signal.SIGUSR1, on_sigusr1)

def do_transition():
    step_time = FADE_IN_DURATION / STEPS
    for i in range(STEPS + 1):
        opacity[0] = i / STEPS
        GLib.idle_add(win.queue_draw)
        time.sleep(step_time)

    # Só começa o fade-out quando receber o sinal "tudo modificado",
    # ou depois de MAX_HOLD segundos como rede de segurança.
    ready_to_fade_out.wait(timeout=MAX_HOLD)

    step_time = FADE_OUT_DURATION / STEPS
    for i in range(STEPS, -1, -1):
        opacity[0] = i / STEPS
        GLib.idle_add(win.queue_draw)
        time.sleep(step_time)
    GLib.idle_add(win.destroy)

t = threading.Thread(target=do_transition)
t.daemon = True
t.start()
Gtk.main()
