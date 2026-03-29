#!/usr/bin/env python3
import gi
import json
import argparse
import logging
import sys
import signal
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib

# Configuração do Logger
logger = logging.getLogger(__name__)

/* Escreve a saída no formato JSON para o Waybar */
def write_output(text, player, mode):
    logger.info('Escrevendo saída')

    if mode == 'paused':
        output = {
            'text':  text,
            'class': 'paused',
            'alt':   player.props.player_name
        }
    else:
        output = {
            'text':  text,
            'class': 'playing',
            'alt':   player.props.player_name
        }

    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()

/* Chamado quando o status de reprodução muda */
def on_play(player, status, manager):
    logger.info('Novo status de reprodução recebido')
    on_metadata(player, player.props.metadata, manager)

/* Chamado quando os metadados da música mudam */
def on_metadata(player, metadata, manager):
    logger.info('Novos metadados recebidos')
    track_info = ''

    # Lógica específica para anúncios no Spotify
    if player.props.player_name == 'spotify' and \
       'mpris:trackid' in metadata.keys() and \
       ':ad:' in player.props.metadata['mpris:trackid']:
        track_info = 'ANÚNCIO TOCANDO'
    elif player.get_artist() != '' and player.get_title() != '':
        track_info = '{title}'.format(title=player.get_title())
    else:
        track_info = player.get_title()

    if player.props.status != 'Playing' and track_info:
        write_output(track_info, player, 'paused')
    else:
        write_output(track_info, player, 'playing')

/* Chamado quando um novo player de mídia aparece no sistema */
def on_player_appeared(manager, player, selected_player=None):
    if player is not None and (selected_player is None or player.name == selected_player):
        init_player(manager, player)
    else:
        logger.debug("Novo player apareceu, mas não é o selecionado, ignorando")

/* Chamado quando um player de mídia é fechado */
def on_player_vanished(manager, player):
    logger.info('O player desapareceu')
    sys.stdout.write('\n')
    sys.stdout.flush()

/* Inicializa as conexões de sinal do player */
def init_player(manager, name):
    logger.debug('Inicializando player: {player}'.format(player=name.name))
    player = Playerctl.Player.new_from_name(name)
    player.connect('playback-status', on_play, manager)
    player.connect('metadata', on_metadata, manager)
    manager.manage_player(player)
    on_metadata(player, player.props.metadata, manager)

/* Manipula sinais de interrupção (Ctrl+C, etc) */
def signal_handler(sig, frame):
    logger.debug('Sinal de parada recebido, saindo')
    sys.stdout.write('\n')
    sys.stdout.flush()
    sys.exit(0)

/* Processa os argumentos da linha de comando */
def parse_arguments():
    parser = argparse.ArgumentParser()
    # Aumenta a verbosidade a cada ocorrência de -v
    parser.add_argument('-v', '--verbose', action='count', default=0)
    # Define qual player específico monitorar
    parser.add_argument('--player')
    return parser.parse_args()

/* Função principal */
def main():
    arguments = parse_arguments()

    # Inicializa o logging
    logging.basicConfig(stream=sys.stderr, level=logging.DEBUG,
                        format='%(name)s %(levelname)s %(message)s')

    # O Log é definido como WARN por padrão. Diminui a cada -v usado.
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Loga os argumentos recebidos
    logger.debug('Argumentos recebidos {}'.format(vars(arguments)))

    manager = Playerctl.PlayerManager()
    loop = GLib.MainLoop()

    manager.connect('name-appeared',
                    lambda *args: on_player_appeared(*args, arguments.player))
    manager.connect('player-vanished', on_player_vanished)

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)

    for player in manager.props.player_names:
        if arguments.player is not None and arguments.player != player.name:
            logger.debug('{player} não é o player filtrado, ignorando'
                         .format(player=player.name))
            continue

        init_player(manager, player)

    loop.run()

if __name__ == '__main__':
    main()
