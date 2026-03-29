# Gerado pelo assistente de configuração do Powerlevel10k em 2024-02-15 às 12:35 -03.
# Baseado em romkatv/powerlevel10k/config/p10k-rainbow.zsh, checksum 29251.
# Opções do assistente: nerdfont-complete + powerline, ícones pequenos, rainbow, unicode,
# separadores angulares, cabeças afiadas, caudas planas, 1 linha, compacto, muitos ícones, conciso,
# instant_prompt=verbose.
# Digite `p10k configure` para gerar outra configuração.
#
# Configuração para Powerlevel10k com estilo de prompt powerline e fundo colorido.
# Digite `p10k configure` para gerar sua própria configuração baseada nela.
#
# Dica: Procurando por uma cor legal? Aqui está um comando de uma linha para imprimir o mapa de cores.
#
#   for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

# Altera as opções temporariamente.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'          ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Redefine todas as opções de configuração. Isso permite aplicar alterações de configuração sem
  # reiniciar o zsh. Edite ~/.p10k.zsh e digite `source ~/.p10k.zsh`.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 é obrigatório.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # A lista de segmentos mostrados à esquerda. Preencha com os segmentos mais importantes.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # identificador do SO
    dir                     # diretório atual
    vcs                     # status do git
    # prompt_char           # símbolo do prompt
  )

  # A lista de segmentos mostrados à direita. Preencha com segmentos menos importantes.
  # O prompt à direita na última linha (onde você digita os comandos) é
  # ocultado automaticamente quando a linha de entrada o alcança. O prompt à direita acima da
  # última linha do prompt é ocultado se ele se sobrepuser ao prompt da esquerda.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # código de saída do último comando
    command_execution_time  # duração do último comando
    background_jobs         # presença de processos em segundo plano
    direnv                  # status do direnv (https://direnv.net/)
    asdf                    # gerenciador de versão asdf (https://github.com/asdf-vm/asdf)
    virtualenv              # ambiente virtual python (https://docs.python.org/3/library/venv.html)
    anaconda                # ambiente conda (https://conda.io/)
    pyenv                   # ambiente python (https://github.com/pyenv/pyenv)
    goenv                   # ambiente go (https://github.com/syndbg/goenv)
    nodenv                  # versão node.js do nodenv (https://github.com/nodenv/nodenv)
    nvm                     # versão node.js do nvm (https://github.com/nvm-sh/nvm)
    nodeenv                 # ambiente node.js (https://github.com/ekalinin/nodeenv)
    # node_version          # versão do node.js
    # go_version            # versão do go (https://golang.org)
    # rust_version          # versão do rustc (https://www.rust-lang.org)
    # dotnet_version        # versão do .NET (https://dotnet.microsoft.com)
    # php_version           # versão do php (https://www.php.net/)
    # laravel_version       # versão do framework php laravel (https://laravel.com/)
    # java_version          # versão do java (https://www.java.com/)
    # package               # nome@versão do package.json (https://docs.npmjs.com/files/package.json)
    rbenv                   # versão ruby do rbenv (https://github.com/rbenv/rbenv)
    rvm                     # versão ruby do rvm (https://rvm.io)
    fvm                     # gerenciamento de versão flutter (https://github.com/leoafarias/fvm)
    luaenv                  # versão lua do luaenv (https://github.com/cehoffman/luaenv)
    jenv                    # versão java do jenv (https://github.com/jenv/jenv)
    plenv                   # versão perl do plenv (https://github.com/tokuhirom/plenv)
    perlbrew                # versão perl do perlbrew (https://github.com/gugod/App-perlbrew)
    phpenv                  # versão php do phpenv (https://github.com/phpenv/phpenv)
    scalaenv                # versão scala do scalaenv (https://github.com/scalaenv/scalaenv)
    haskell_stack           # versão haskell do stack (https://haskellstack.org/)
    kubecontext             # contexto atual do kubernetes (https://kubernetes.io/)
    terraform               # workspace do terraform (https://www.terraform.io)
    # terraform_version     # versão do terraform (https://www.terraform.io)
    aws                     # perfil aws (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    aws_eb_env              # ambiente aws elastic beanstalk (https://aws.amazon.com/elasticbeanstalk/)
    azure                   # nome da conta azure (https://docs.microsoft.com/en-us/cli/azure)
    gcloud                  # conta e projeto google cloud cli (https://cloud.google.com/)
    google_app_cred         # credenciais de aplicação google (https://cloud.google.com/docs/authentication/production)
    toolbox                 # nome da toolbox (https://github.com/containers/toolbox)
    context                 # usuario@hostname
    nordvpn                 # status da conexão nordvpn, apenas linux (https://nordvpn.com/)
    ranger                  # shell do ranger (https://github.com/ranger/ranger)
    nnn                     # shell do nnn (https://github.com/jarun/nnn)
    lf                      # shell do lf (https://github.com/gokcehan/lf)
    xplr                    # shell do xplr (https://github.com/sayanarijit/xplr)
    vim_shell               # indicador de shell do vim (:sh)
    midnight_commander      # shell do midnight commander (https://midnight-commander.org/)
    nix_shell               # shell do nix (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    vi_mode                 # modo vi (você não precisa disso se ativou o prompt_char)
    # vpn_ip                # indicador de rede virtual privada
    # load                  # carga da CPU
    # disk_usage            # uso de disco
    # ram                   # RAM livre
    # swap                  # swap usada
    todo                    # itens do todo (https://github.com/todotxt/todo.txt-cli)
    timewarrior             # status do timewarrior (https://timewarrior.net/)
    taskwarrior             # contagem de tarefas do taskwarrior (https://taskwarrior.org/)
    # cpu_arch              # arquitetura da CPU
    # time                  # hora atual
    # ip                    # endereço ip e uso de largura de banda para uma interface de rede específica
    # public_ip             # endereço IP público
    # proxy                 # proxy http/https/ftp do sistema
    # battery               # bateria interna
    # wifi                  # velocidade do wifi
    # example               # segmento de exemplo definido pelo usuário (veja a função prompt_example abaixo)
  )

  # Define o conjunto de caracteres usado pelo powerlevel10k. É melhor deixar o `p10k configure` definir isso para você.
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  # Quando definido como `moderate`, alguns ícones terão um espaço extra depois deles. Isso serve para evitar
  # sobreposição de ícones ao usar fontes não monoespaçadas. Quando definido como `none`, espaços não são adicionados.
  typeset -g POWERLEVEL9K_ICON_PADDING=none

  # Quando definido como true, os ícones aparecem antes do conteúdo em ambos os lados do prompt. Quando definido
  # como false, os ícones vão depois do conteúdo. Se vazio ou não definido, os ícones vão antes do conteúdo no
  # prompt da esquerda e depois do conteúdo no prompt da direita.
  #
  # Você também pode sobrescrever isso para um segmento específico:
  #
  #   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
  #
  # Ou para um segmento específico em um estado específico:
  #
  #   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

  # Adiciona uma linha vazia antes de cada prompt.
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

  # Conecta as linhas do prompt da esquerda com estes símbolos. Você provavelmente vai querer usar a mesma cor
  # que POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND abaixo.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%242F╭─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%242F├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%242F╰─'
  # Conecta as linhas do prompt da direita com estes símbolos.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%242F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%242F─┤'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%242F─╯'

  # Preenchimento entre o prompt da esquerda e da direita na primeira linha do prompt. Você pode definir como ' ', '·' ou
  # '─'. Os dois últimos tornam mais fácil ver o alinhamento entre o prompt esquerdo e direito e para
  # separar o prompt da saída do comando. Você pode querer definir POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
  # para um prompt mais compacto se usar esta opção.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    # A cor do preenchimento. Você provavelmente vai querer combinar com a cor dos ornamentos
    # POWERLEVEL9K_MULTILINE definidos acima.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=242
    # Inicia o preenchimento a partir da borda da tela se não houver segmentos à esquerda na primeira linha.
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    # Termina o preenchimento na borda da tela se não houver segmentos à direita na primeira linha.
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  # Separador entre segmentos da mesma cor à esquerda.
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  # Separador entre segmentos da mesma cor à direita.
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  # Separador entre segmentos de cores diferentes à esquerda.
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  # Separador entre segmentos de cores diferentes à direita.
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  # O fim direito do prompt da esquerda.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  # O início esquerdo do prompt da direita.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  # O início esquerdo do prompt da esquerda.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
  # O fim direito do prompt da direita.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  # Terminador do prompt de linha vazia para linhas sem nenhum segmento.
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  #################################[ os_icon: identificador de SO ]##################################
  # Cor do identificador de SO.
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=75
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7
  # Ícone personalizado.
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰣇'

  ################################[ prompt_char: símbolo do prompt ]################################
  # Fundo transparente.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  # Símbolo do prompt verde se o último comando teve sucesso.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
  # Símbolo do prompt vermelho se o último comando falhou.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
  # Símbolo do prompt padrão.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  # Símbolo do prompt no modo vi de comando.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  # Símbolo do prompt no modo vi visual.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  # Símbolo do prompt no modo vi de sobrescrita.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  # Sem terminador de linha se prompt_char for o último segmento.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  # Sem introdutor de linha se prompt_char for o primeiro segmento.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  # Sem espaços em branco ao redor.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  ##################################[ dir: diretório atual ]##################################
  # Cor de fundo do diretório atual.
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=4
  # Ícone personalizado.
  typeset -g POWERLEVEL9K_HOME_ICON='󰋜'
  typeset -g POWERLEVEL9K_HOME_SUB_ICON='󰋜'
  typeset -g POWERLEVEL9K_FOLDER_ICON='󰋜'
  # Cor de frente padrão do diretório atual.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=254
  # Se o diretório for muito longo, encurta alguns de seus segmentos para o prefixo único mais curto possível.
  # O diretório encurtado pode ser completado com TAB para o original.
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  # Substitui os sufixos dos segmentos removidos por este símbolo.
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  # Cor dos segmentos de diretório encurtados.
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=250
  # Cor dos segmentos de diretório "âncora". Segmentos âncora nunca são encurtados. O primeiro
  # segmento é sempre uma âncora.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
  # Exibe segmentos de diretório âncora em negrito.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  # Não encurta diretórios que contenham qualquer um destes arquivos. Eles são âncoras.
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  # Se definido como "first" ("last"), remove tudo antes do primeiro (último) subdiretório que contenha
  # arquivos correspondentes a $POWERLEVEL9K_SHORTEN_FOLDER_MARKER. Por exemplo, quando o diretório atual é
  # /foo/bar/git_repo/nested_git_repo/baz, o prompt exibirá git_repo/nested_git_repo/baz (first)
  # ou nested_git_repo/baz (last). Isso assume que git_repo e nested_git_repo contêm marcadores
  # e outros diretórios não.
  #
  # Opcionalmente, "first" e "last" podem ser seguidos por ":<offset>" onde <offset> é um inteiro.
  # Isso move o ponto de truncamento para a direita (offset positivo) ou para a esquerda (offset negativo)
  # em relação ao marcador. "first" e "last" puros são equivalentes a "first:0" e "last:0"
  # respectivamente.
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  # Não encurta esta quantidade de últimos segmentos de diretório. Eles são âncoras.
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  # Encurta o diretório se ele for mais longo que isso, mesmo que haja espaço para ele. O valor pode
  # ser absoluto (ex: '80') ou uma porcentagem da largura do terminal (ex: '50%'). Se vazio,
  # o diretório será encurtado apenas quando o prompt não couber ou quando outros parâmetros exigirem
  # (veja POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS e POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT abaixo).
  # Se definido como `0`, o diretório será sempre encurtado ao seu comprimento mínimo.
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  # Quando o segmento `dir` está na última linha do prompt, tenta encurtá-lo o suficiente para deixar pelo menos
  # esta quantidade de colunas para digitar comandos.
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  # Quando o segmento `dir` está na última linha do prompt, tenta encurtá-lo o suficiente para deixar pelo menos
  # COLUMNS * POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT * 0.01 colunas para digitar comandos.
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  # Se definido como true, incorpora um hyperlink no diretório. Útil para abrir
  # rapidamente um diretório no gerenciador de arquivos simplesmente clicando no link.
  # Também pode ser útil quando o diretório está encurtado, pois permite ver
  # o caminho completo que foi usado em comandos anteriores.
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

  # Ativa estilização especial para diretórios sem permissão de escrita e inexistentes. Veja POWERLEVEL9K_LOCK_ICON
  # e POWERLEVEL9K_DIR_CLASSES abaixo.
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  # O ícone padrão mostrado ao lado de diretórios sem permissão de escrita e inexistentes quando
  # POWERLEVEL9K_DIR_SHOW_WRITABLE está definido como v3.
  # typeset -g POWERLEVEL9K_LOCK_ICON='⭐'

  # POWERLEVEL9K_DIR_CLASSES permite especificar ícones e cores personalizados para diferentes
  # diretórios. Deve ser um array com 3 * N elementos. Cada trio consiste em:
  #
  #   1. Um padrão contra o qual o diretório atual ($PWD) é comparado. A comparação é feita com
  #      a opção extended_glob ativada.
  #   2. Classe do diretório para fins de estilo.
  #   3. Uma string vazia.
  #
  # Os trios são testados em ordem. O primeiro trio cujo padrão coincidir com $PWD vence.
  #
  # Se POWERLEVEL9K_DIR_SHOW_WRITABLE estiver definido como v3, diretórios sem permissão de escrita e inexistentes
  # adquirem o sufixo de classe _NOT_WRITABLE e NON_EXISTENT respectivamente.
  #
  # Por exemplo, dadas estas configurações:
  #
  #   typeset -g POWERLEVEL9K_DIR_CLASSES=(
  #     '~/work(|/*)'  WORK     ''
  #     '~(|/*)'       HOME     ''
  #     '*'            DEFAULT  '')
#
  # Sempre que o diretório atual for ~/work ou um subdiretório de ~/work, ele será estilizado com uma
  # das seguintes classes, dependendo de sua permissão de escrita e existência: WORK, WORK_NOT_WRITABLE ou
  # WORK_NON_EXISTENT.
  #
  # Simplesmente atribuir classes aos diretórios não tem efeitos visíveis. Apenas oferece a
  # opção de definir cores e ícones personalizados para diferentes classes de diretório.
  #
  #   # Estilização para WORK.
  #   typeset -g POWERLEVEL9K_DIR_WORK_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_DIR_WORK_BACKGROUND=4
  #   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=254
  #   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=250
  #   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=255
  #
  #   # Estilização para WORK_NOT_WRITABLE.
  #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_BACKGROUND=4
  #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_FOREGROUND=254
  #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_SHORTENED_FOREGROUND=250
  #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_ANCHOR_FOREGROUND=255
  #
  #   # Estilização para WORK_NON_EXISTENT.
  #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_BACKGROUND=4
  #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_FOREGROUND=254
  #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_SHORTENED_FOREGROUND=250
  #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_ANCHOR_FOREGROUND=255
  #
  # Se um parâmetro de estilização não for definido explicitamente para alguma classe, ele recorre ao
  # parâmetro sem classe. Por exemplo, se POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_FOREGROUND não for definido,
  # ele usará POWERLEVEL9K_DIR_FOREGROUND.
  #
  # typeset -g POWERLEVEL9K_DIR_CLASSES=()

  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_DIR_PREFIX='em '

  #####################################[ vcs: status do git ]######################################
  # Cores de fundo do controle de versão.
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=3
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

  # Ícone de branch. Defina este parâmetro como '\UE0A0 ' para o popular ícone de branch do Powerline.
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

  # Ícone de arquivos não rastreados (untracked). É realmente uma interrogação, sua fonte não está quebrada.
  # Altere o valor deste parâmetro para exibir um ícone diferente.
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  # Formatador para o status do Git.
  #
  # Exemplo de saída: master wip ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
  #
  # Você pode editar a função para personalizar a aparência do status do Git.
  #
  # Os parâmetros VCS_STATUS_* são definidos pelo plugin gitstatus. Veja a referência:
  # https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      # Se P9K_CONTENT não estiver vazio, use-o. Ou é "loading" (carregando) ou vem de vcs_info
      # (não do plugin gitstatus). Parâmetros VCS_STATUS_* não estão disponíveis neste caso.
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    # Estilização para diferentes partes do status do Git.
    local        meta='%7F' # frente branca
    local       clean='%0F' # frente preta
    local    modified='%0F' # frente preta
    local   untracked='%0F' # frente preta
    local conflicted='%1F' # frente vermelha

    local res

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      # Se o nome da branch local tiver no máximo 32 caracteres, exiba-o completo.
      # Caso contrário, exiba os primeiros 12 … os últimos 12.
      # Dica: Para sempre exibir o nome da branch completo sem truncamento, exclua a próxima linha.
      (( $#branch > 32 )) && branch[13,-13]="…"  # <-- esta linha
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi

    if [[ -n $VCS_STATUS_TAG
          # Exibe a tag apenas se não estiver em uma branch.
          # Dica: Para sempre exibir a tag, exclua a próxima linha.
          && -z $VCS_STATUS_LOCAL_BRANCH  # <-- esta linha
        ]]; then
      local tag=${(V)VCS_STATUS_TAG}
      # Se o nome da tag tiver no máximo 32 caracteres, exiba-o completo.
      # Caso contrário, exiba os primeiros 12 … os últimos 12.
      # Dica: Para sempre exibir o nome da tag completo sem truncamento, exclua a próxima linha.
      (( $#tag > 32 )) && tag[13,-13]="…"  # <-- esta linha
      res+="${meta}#${clean}${tag//\%/%%}"
    fi

    # Exibe o commit atual do Git se não houver branch nem tag.
    # Dica: Para sempre exibir o commit atual do Git, exclua a próxima linha.
    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- esta linha
      res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    # Exibe o nome da branch de rastreamento (tracking) se for diferente da branch local.
    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    # Exibe "wip" se o resumo do último commit contiver "wip" ou "WIP".
    if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
      res+=" ${modified}wip"
    fi

    # ⇣42 se estiver atrás do remoto.
    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    # ⇡42 se estiver à frente do remoto; sem espaço inicial se também estiver atrás: ⇣42⇡42.
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    # ⇠42 se estiver atrás do remoto de push.
    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    # ⇢42 se estiver à frente do remoto de push; sem espaço inicial se também estiver atrás: ⇠42⇢42.
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    # *42 se houver stashes.
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    # 'merge' se o repositório estiver em um estado incomum.
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    # ~42 se houver conflitos de mesclagem (merge).
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    # +42 se houver alterações preparadas (staged).
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    # !42 se houver alterações não preparadas (unstaged).
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    # ?42 se houver arquivos não rastreados. É realmente uma interrogação, sua fonte não está quebrada.
    # Veja POWERLEVEL9K_VCS_UNTRACKED_ICON acima se quiser usar um ícone diferente.
    # Remova a próxima linha se não quiser ver arquivos não rastreados de forma alguma.
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    # "─" se o número de arquivos não preparados for desconhecido. Isso pode acontecer devido ao
    # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (veja abaixo) estar definido com um número não negativo menor
    # que o número de arquivos no índice do Git, ou devido a bash.showDirtyState estar definido como false
    # na configuração do repositório. O número de arquivos preparados e não rastreados também pode ser desconhecido.
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  # Não conte o número de arquivos não preparados, não rastreados e em conflito em repositórios Git com
  # mais arquivos no índice do que este valor. Valor negativo significa infinito.
  #
  # Se você trabalha em repositórios Git com dezenas de milhões de arquivos e percebe queda de desempenho,
  # tente definir POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY para um número menor que a saída
  # de `git ls-files | wc -l`. Alternativamente, adicione `bash.showDirtyState = false` à configuração
  # do repositório: `git config bash.showDirtyState false`.
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

  # Não exibe o status do Git no prompt para repositórios cujo diretório de trabalho coincida com este padrão.
  # Por exemplo, se definido como '~', o repositório Git em $HOME/.git será ignorado.
  # Múltiplos padrões podem ser combinados com '|': '~(|/foo)|/bar/baz/*'.
  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

  # Desativa a formatação padrão do status do Git.
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  # Instala nosso próprio formatador de status do Git.
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  # Ativa contadores para arquivos preparados, não preparados, etc.
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_VCS_PREFIX='em '

  # Exibe o status de repositórios destes tipos. Você pode adicionar svn e/ou hg se estiver
  # usando-os. Se o fizer, seu prompt pode ficar lento mesmo quando seu diretório atual
  # não estiver em um repositório svn ou hg.
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  ##########################[ status: código de saída do último comando ]###########################
  # Ativa os estados de status OK_PIPE, ERROR_PIPE e ERROR_SIGNAL para nos permitir ativar, desativar e
  # estilizá-los independentemente dos estados regulares OK e ERROR.
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  # Status em caso de sucesso. Sem conteúdo, apenas um ícone. Não é necessário exibi-lo se o prompt_char estiver ativado,
  # pois ele indicará sucesso ficando verde.
  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0

  # Status quando parte de um comando em pipe falha, mas o status de saída geral é zero. Pode parecer
  # com isto: 1|0.
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0

  # Status quando é apenas um código de erro (ex: '1'). Não é necessário exibi-lo se o prompt_char estiver ativado,
  # pois ele indicará erro ficando vermelho.
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1

  # Status quando o último comando foi encerrado por um sinal.
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  # Usa nomes de sinais concisos: "INT" em vez de "SIGINT(2)".
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1

  # Status quando parte de um comando em pipe falha e o status de saída geral também é diferente de zero.
  # Pode parecer com isto: 1|0.
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

###################[ command_execution_time: duração do último comando ]###################
  # Cor do tempo de execução.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
  # Exibe a duração do último comando se levar pelo menos este número de segundos.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  # Exibe este número de dígitos fracionários. Zero significa arredondar para segundos.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  # Formato de duração: 1d 2h 3m 4s.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='demorou '

  #######################[ background_jobs: presença de tarefas em segundo plano ]#######################
  # Cor das tarefas em segundo plano.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
  # Não exibe o número de tarefas em segundo plano.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ direnv: status do direnv (https://direnv.net/) ]########################
  # Cor do Direnv.
  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=3
  typeset -g POWERLEVEL9K_DIRENV_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ asdf: gerenciador de versão asdf (https://github.com/asdf-vm/asdf) ]###############
  # Cor padrão do asdf. Usada apenas para exibir ferramentas para as quais não há substituição de cor (veja abaixo).
  # Dica: Substitua estes parâmetros para ${TOOL} com POWERLEVEL9K_ASDF_${TOOL}_FOREGROUND e
  # POWERLEVEL9K_ASDF_${TOOL}_BACKGROUND.
  typeset -g POWERLEVEL9K_ASDF_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_BACKGROUND=7

  # Existem quatro parâmetros que podem ser usados para ocultar ferramentas do asdf. Cada parâmetro descreve
  # as condições sob as quais uma ferramenta é ocultada. Parâmetros podem ocultar ferramentas, mas não reexibi-las.
  # Se pelo menos um parâmetro decidir ocultar uma ferramenta, ela será ocultada. Se nenhum parâmetro decidir
  # ocultar, ela será exibida.
  #
  # Nota especial sobre a diferença entre POWERLEVEL9K_ASDF_SOURCES e
  # POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW. Considere o efeito dos seguintes comandos:
  #
  #   asdf local  python 3.8.1
  #   asdf global python 3.8.1
  #
  # Após executar ambos os comandos, a versão atual do python é 3.8.1 e sua fonte é "local", pois
  # tem precedência sobre "global". Se POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW estiver definido como false,
  # o python será ocultado neste caso porque 3.8.1 é a mesma que a versão global.
  # POWERLEVEL9K_ASDF_SOURCES ocultará a versão do python apenas se o valor deste parâmetro não
  # contiver "local".

  # Oculta versões de ferramentas que não venham de uma destas fontes.
  #
  # Fontes disponíveis:
  #
  # - shell   `asdf current` diz "set by ASDF_${TOOL}_VERSION environment variable"
  # - local   `asdf current` diz "set by /algum/diretorio/que/nao/e/home/arquivo"
  # - global  `asdf current` diz "set by /home/usuario/arquivo"
  #
  # Nota: Se este parâmetro for definido como (shell local global), ele não ocultará ferramentas.
  # Dica: Substitua este parâmetro para ${TOOL} com POWERLEVEL9K_ASDF_${TOOL}_SOURCES.
  typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

  # Se definido como false, oculta versões de ferramentas que sejam iguais à global.
  #
  # Nota: O nome deste parâmetro não reflete bem o seu significado.
  # Nota: Se este parâmetro for definido como true, ele não ocultará ferramentas.
  # Dica: Substitua este parâmetro para ${TOOL} com POWERLEVEL9K_ASDF_${TOOL}_PROMPT_ALWAYS_SHOW.
  typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

  # Se definido como false, oculta versões de ferramentas que sejam iguais a "system" (sistema).
  #
  # Nota: Se este parâmetro for definido como true, ele não ocultará ferramentas.
  # Dica: Substitua este parâmetro para ${TOOL} com POWERLEVEL9K_ASDF_${TOOL}_SHOW_SYSTEM.
  typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

  # Se definido com um valor não vazio, oculta ferramentas a menos que haja um arquivo correspondente ao padrão
  # especificado no diretório atual, ou em seu diretório pai, avô, e assim por diante.
  #
  # Nota: Se este parâmetro for definido com um valor vazio, ele não ocultará ferramentas.
  # Nota: SHOW_ON_UPGLOB não é específico do asdf. Funciona com todos os segmentos do prompt.
  # Dica: Substitua este parâmetro para ${TOOL} com POWERLEVEL9K_ASDF_${TOOL}_SHOW_ON_UPGLOB.
  #
  # Exemplo: Oculta a versão do nodejs quando não houver package.json nem arquivos *.js no diretório
  # atual, em `..`, em `../..` e assim por diante.
  #
  #   typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.js|package.json'
  typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

  # Versão Ruby do asdf.
  typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND=1
  # typeset -g POWERLEVEL9K_ASDF_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Python do asdf.
  typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND=4
  # typeset -g POWERLEVEL9K_ASDF_PYTHON_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PYTHON_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Go do asdf.
  typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND=4
  # typeset -g POWERLEVEL9K_ASDF_GOLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_GOLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Node.js do asdf.
  typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND=2
  # typeset -g POWERLEVEL9K_ASDF_NODEJS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Rust do asdf.
  typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND=208
  # typeset -g POWERLEVEL9K_ASDF_RUST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_RUST_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão .NET Core do asdf.
  typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND=5
  # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Flutter do asdf.
  typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND=4
  # typeset -g POWERLEVEL9K_ASDF_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Lua do asdf.
  typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND=4
  # typeset -g POWERLEVEL9K_ASDF_LUA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_LUA_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Java do asdf.
  typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=1
  typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND=7
  # typeset -g POWERLEVEL9K_ASDF_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Perl do asdf.
  typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND=4
  # typeset -g POWERLEVEL9K_ASDF_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Erlang do asdf.
  typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND=1
  # typeset -g POWERLEVEL9K_ASDF_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Elixir do asdf.
  typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND=5
  # typeset -g POWERLEVEL9K_ASDF_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Postgres do asdf.
  typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND=6
  # typeset -g POWERLEVEL9K_ASDF_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_POSTGRES_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão PHP do asdf.
  typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND=5
  # typeset -g POWERLEVEL9K_ASDF_PHP_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PHP_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Haskell do asdf.
  typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND=3
  # typeset -g POWERLEVEL9K_ASDF_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Versão Julia do asdf.
  typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=0
  typeset -g POWERLEVEL9K_ASDF_JULIA_BACKGROUND=2
  # typeset -g POWERLEVEL9K_ASDF_JULIA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_JULIA_SHOW_ON_UPGLOB='*.foo|*.bar'

  ##########[ nordvpn: status da conexão nordvpn, apenas linux (https://nordvpn.com/) ]###########
  # Cor do indicador de conexão NordVPN.
  typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=7
  typeset -g POWERLEVEL9K_NORDVPN_BACKGROUND=4
  # Oculta o indicador de conexão NordVPN quando não estiver conectado.
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ ranger: shell do ranger (https://github.com/ranger/ranger) ]##################
  # Cor do shell do Ranger.
  typeset -g POWERLEVEL9K_RANGER_FOREGROUND=3
  typeset -g POWERLEVEL9K_RANGER_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_RANGER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ nnn: shell do nnn (https://github.com/jarun/nnn) ]#######################
  # Cor do shell do nnn.
  typeset -g POWERLEVEL9K_NNN_FOREGROUND=0
  typeset -g POWERLEVEL9K_NNN_BACKGROUND=6
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NNN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ lf: shell do lf (https://github.com/gokcehan/lf) ]#######################
  # Cor do shell do lf.
  typeset -g POWERLEVEL9K_LF_FOREGROUND=0
  typeset -g POWERLEVEL9K_LF_BACKGROUND=6
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_LF_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################[ xplr: shell do xplr (https://github.com/sayanarijit/xplr) ]##################
  # Cor do shell do xplr.
  typeset -g POWERLEVEL9K_XPLR_FOREGROUND=0
  typeset -g POWERLEVEL9K_XPLR_BACKGROUND=6
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_XPLR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########################[ vim_shell: indicador de shell do vim (:sh) ]###########################
  # Cor do indicador de shell do Vim.
  typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=0
  typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND=2
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######[ midnight_commander: shell do midnight commander (https://midnight-commander.org/) ]######
  # Cor do shell do Midnight Commander.
  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=3
  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #[ nix_shell: nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html) ]##
  # Cor do shell do Nix.
  typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=0
  typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND=4

  # Dica: Se você quiser ver apenas o ícone sem "pure" e "impure", desente a próxima linha.
  # typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

##################################[ disk_usage: uso de disco ]##################################
  # Cores para diferentes níveis de uso de disco.
  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=3
  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=0
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=0
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=3
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=7
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=1
  # Limites para diferentes níveis de uso de disco (pontos percentuais).
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
  # Se definido como true, oculta o uso de disco quando estiver abaixo do nível de aviso (WARNING_LEVEL).
  typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ vi_mode: modo vi (você não precisa disso se ativou o prompt_char) ]###########
  # Cor da fonte.
  typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND=0
  # Texto e cor para o modo vi normal (também conhecido como modo de comando).
  typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
  typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=2
  # Texto e cor para o modo vi visual.
  typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
  typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=4
  # Texto e cor para o modo vi de sobreposição (overtype/replace).
  typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
  typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=3
  # Texto e cor para o modo vi de inserção.
  typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
  typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=8

  ######################################[ ram: RAM livre ]#######################################
  # Cor da RAM.
  typeset -g POWERLEVEL9K_RAM_FOREGROUND=0
  typeset -g POWERLEVEL9K_RAM_BACKGROUND=3
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################################[ swap: swap utilizada ]######################################
  # Cor da Swap.
  typeset -g POWERLEVEL9K_SWAP_FOREGROUND=0
  typeset -g POWERLEVEL9K_SWAP_BACKGROUND=3
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################################[ load: carga da CPU ]######################################
  # Mostra a carga média da CPU durante os últimos minutos. Valores válidos são 1, 5 e 15.
  typeset -g POWERLEVEL9K_LOAD_WHICH=5
  # Cor da carga quando está abaixo de 50%.
  typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=2
  # Cor da carga quando está entre 50% e 70%.
  typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_WARNING_BACKGROUND=3
  # Cor da carga quando está acima de 70%.
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=1
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_LOAD_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ todo: itens a fazer (https://github.com/todotxt/todo.txt-cli) ]################
  # Cor do Todo.
  typeset -g POWERLEVEL9K_TODO_FOREGROUND=0
  typeset -g POWERLEVEL9K_TODO_BACKGROUND=8
  # Oculta o segmento todo quando o número total de tarefas for zero.
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
  # Oculta o segmento todo quando o número de tarefas após a filtragem for zero.
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

  # Formato do Todo. Os seguintes parâmetros estão disponíveis na expansão:
  #
  # - P9K_TODO_TOTAL_TASK_COUNT     O número total de tarefas.
  # - P9K_TODO_FILTERED_TASK_COUNT  O número de tarefas após a filtragem.
  #
  # Estas variáveis correspondem à última linha da saída de `todo.sh -p ls`:
  #
  #    TODO: 24 of 42 tasks shown
  #
  # Aqui 24 é P9K_TODO_FILTERED_TASK_COUNT e 42 é P9K_TODO_TOTAL_TASK_COUNT.
  #
  # typeset -g POWERLEVEL9K_TODO_CONTENT_EXPANSION='$P9K_TODO_FILTERED_TASK_COUNT'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ timewarrior: status do timewarrior (https://timewarrior.net/) ]############
  # Cor do Timewarrior.
  typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=255
  typeset -g POWERLEVEL9K_TIMEWARRIOR_BACKGROUND=8

  # Se a tarefa rastreada for maior que 24 caracteres, trunca e adiciona "…".
  # Dica: Para sempre exibir tarefas sem truncamento, exclua o parâmetro a seguir.
  # Dica: Para ocultar nomes de tarefas e exibir apenas o ícone quando o rastreamento estiver ativo,
  # defina o valor do parâmetro a seguir como "".
  typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TIMEWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ taskwarrior: contagem de tarefas taskwarrior (https://taskwarrior.org/) ]##############
  # Cor do Taskwarrior.
  typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=0
  typeset -g POWERLEVEL9K_TASKWARRIOR_BACKGROUND=6

  # Formato do segmento Taskwarrior. Os seguintes parâmetros estão disponíveis:
  #
  # - P9K_TASKWARRIOR_PENDING_COUNT   Número de tarefas pendentes: `task +PENDING count`.
  # - P9K_TASKWARRIOR_OVERDUE_COUNT   Número de tarefas atrasadas: `task +OVERDUE count`.
  #
  # Valores zero são representados como parâmetros vazios.
  #
  # O formato padrão:
  #
  #    '${P9K_TASKWARRIOR_OVERDUE_COUNT:+"!$P9K_TASKWARRIOR_OVERDUE_COUNT/"}$P9K_TASKWARRIOR_PENDING_COUNT'
  #
  # typeset -g POWERLEVEL9K_TASKWARRIOR_CONTENT_EXPANSION='$P9K_TASKWARRIOR_PENDING_COUNT'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TASKWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################################[ cpu_arch: arquitetura da CPU ]################################
  # Cor da arquitetura da CPU.
  typeset -g POWERLEVEL9K_CPU_ARCH_FOREGROUND=0
  typeset -g POWERLEVEL9K_CPU_ARCH_BACKGROUND=3

  # Oculta o segmento quando em uma arquitetura de CPU específica.
  # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_CONTENT_EXPANSION=
  # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_VISUAL_IDENTIFIER_EXPANSION=

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_CPU_ARCH_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################################[ context: usuario@hostname ]##################################
  # Cor do contexto ao rodar com privilégios (root).
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0
  # Cor do contexto em SSH sem privilégios.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=3
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0
  # Cor de contexto padrão (sem privilégios, sem SSH).
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=3
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0

  # Formato do contexto ao rodar com privilégios: usuario@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
  # Formato do contexto em SSH sem privilégios: usuario@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  # Formato de contexto padrão (sem privilégios, sem SSH): usuario@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  # Não mostra o contexto a menos que esteja rodando com privilégios ou via SSH.
  # Dica: Remova a próxima linha para sempre mostrar o contexto.
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_CONTEXT_PREFIX='com '

  ###[ virtualenv: ambiente virtual python (https://docs.python.org/3/library/venv.html) ]###
  # Cor do ambiente virtual Python.
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=4
  # Não mostra a versão do Python ao lado do nome do ambiente virtual.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  # Se definido como "false", não mostrará o virtualenv se o pyenv já estiver sendo exibido.
  # Se definido como "if-different", não mostrará se for o mesmo que o pyenv.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  # Separa o nome do ambiente da versão do Python apenas com um espaço.
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################[ anaconda: ambiente conda (https://conda.io/) ]######################
  # Cor do ambiente Anaconda.
  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=0
  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND=4

  # Formato do segmento Anaconda. Os seguintes parâmetros estão disponíveis:
  #
  # - CONDA_PREFIX                Caminho absoluto para o ambiente Anaconda/Miniconda ativo.
  # - CONDA_DEFAULT_ENV           Nome do ambiente Anaconda/Miniconda ativo.
  # - CONDA_PROMPT_MODIFIER        Modificador de prompt configurável (veja abaixo).
  # - P9K_ANACONDA_PYTHON_VERSION  Versão atual do python (python --version).
  #
  # CONDA_PROMPT_MODIFIER pode ser configurado com o seguinte comando:
  #
  #    conda config --set env_prompt '({default_env}) '
  #
  # O último argumento é uma string de formato Python que pode usar as seguintes variáveis:
  #
  # - prefix       O mesmo que CONDA_PREFIX.
  # - default_env  O mesmo que CONDA_DEFAULT_ENV.
  # - name         O último segmento de CONDA_PREFIX.
  # - stacked_env  Lista separada por vírgulas de nomes na pilha de ambientes.
  #
  # Nota: '({default_env}) ' é o valor padrão do env_prompt.
  #
  # O valor padrão de POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION expande para $CONDA_PROMPT_MODIFIER
  # sem os parênteses ao redor, ou para o último componente do caminho de CONDA_PREFIX se o primeiro estiver vazio.
  typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}:-${CONDA_PREFIX:t}}'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ pyenv: ambiente python (https://github.com/pyenv/pyenv) ]################
  # Cor do Pyenv.
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_PYENV_BACKGROUND=4
  # Oculta a versão do python se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do python se for a mesma que a global.
  typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do python se for igual a "system".
  typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

  # Formato do segmento Pyenv. Os seguintes parâmetros estão disponíveis:
  #
  # - P9K_CONTENT                Ambiente pyenv atual (pyenv version-name).
  # - P9K_PYENV_PYTHON_VERSION   Versão atual do python (python --version).
  #
  # O formato padrão segue esta lógica:
  #
  # 1. Exibe apenas "$P9K_CONTENT" se for igual a "$P9K_PYENV_PYTHON_VERSION" ou
  #    começar com "$P9K_PYENV_PYTHON_VERSION/".
  # 2. Caso contrário, exibe "$P9K_CONTENT $P9K_PYENV_PYTHON_VERSION".
  typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

################[ goenv: ambiente go (https://github.com/syndbg/goenv) ]################
  # Cor do Goenv.
  typeset -g POWERLEVEL9K_GOENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_GOENV_BACKGROUND=4
  # Oculta a versão do go se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do go se for a mesma que a global.
  typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do go se for igual a "system".
  typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ nodenv: versão node.js do nodenv (https://github.com/nodenv/nodenv) ]##########
  # Cor do Nodenv.
  typeset -g POWERLEVEL9K_NODENV_FOREGROUND=2
  typeset -g POWERLEVEL9K_NODENV_BACKGROUND=0
  # Oculta a versão do node se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do node se for a mesma que a global.
  typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do node se for igual a "system".
  typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ nvm: versão node.js do nvm (https://github.com/nvm-sh/nvm) ]###############
  # Cor do Nvm.
  typeset -g POWERLEVEL9K_NVM_FOREGROUND=0
  typeset -g POWERLEVEL9K_NVM_BACKGROUND=5
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ nodeenv: ambiente node.js (https://github.com/ekalinin/nodeenv) ]############
  # Cor do Nodeenv.
  typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=2
  typeset -g POWERLEVEL9K_NODEENV_BACKGROUND=0
  # Não mostra a versão do Node ao lado do nome do ambiente.
  typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
  # Separa o nome do ambiente da versão do Node apenas com um espaço.
  typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############################[ node_version: versão do node.js ]###############################
  # Cor da versão do Node.
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=7
  typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=2
  # Mostra a versão do node apenas quando estiver em uma árvore de diretórios que contenha package.json.
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ go_version: versão do go (https://golang.org) ]########################
  # Cor da versão do Go.
  typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=255
  typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND=2
  # Mostra a versão do go apenas quando estiver em um subdiretório de um projeto go.
  typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ rust_version: versão do rustc (https://www.rust-lang.org) ]##################
  # Cor da versão do Rust.
  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=0
  typeset -g POWERLEVEL9K_RUST_VERSION_BACKGROUND=208
  # Mostra a versão do rust apenas quando estiver em um subdiretório de um projeto rust.
  typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ dotnet_version: versão .NET (https://dotnet.microsoft.com) ]################
  # Cor da versão .NET.
  typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=7
  typeset -g POWERLEVEL9K_DOTNET_VERSION_BACKGROUND=5
  # Mostra a versão .NET apenas quando estiver em um subdiretório de um projeto .NET.
  typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_DOTNET_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################[ php_version: versão do php (https://www.php.net/) ]######################
  # Cor da versão do PHP.
  typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=0
  typeset -g POWERLEVEL9K_PHP_VERSION_BACKGROUND=5
  # Mostra a versão do PHP apenas quando estiver em um subdiretório de um projeto PHP.
  typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PHP_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ laravel_version: versão do framework php laravel (https://laravel.com/) ]###########
  # Cor da versão do Laravel.
  typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=1
  typeset -g POWERLEVEL9K_LARAVEL_VERSION_BACKGROUND=7
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_LARAVEL_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #############[ rbenv: versão ruby do rbenv (https://github.com/rbenv/rbenv) ]##############
  # Cor do Rbenv.
  typeset -g POWERLEVEL9K_RBENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_RBENV_BACKGROUND=1
  # Oculta a versão do ruby se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do ruby se for a mesma que a global.
  typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do ruby se for igual a "system".
  typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ####################[ java_version: versão do java (https://www.java.com/) ]####################
  # Cor da versão do Java.
  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=1
  typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=7
  # Mostra a versão do java apenas quando estiver em um subdiretório de um projeto java.
  typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
  # Mostra a versão resumida.
  typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_JAVA_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###[ package: name@version do package.json (https://docs.npmjs.com/files/package.json) ]####
  # Cor do Pacote.
  typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=0
  typeset -g POWERLEVEL9K_PACKAGE_BACKGROUND=6

  # Formato do pacote. Os seguintes parâmetros estão disponíveis na expansão:
  #
  # - P9K_PACKAGE_NAME     O valor do campo `name` no package.json.
  # - P9K_PACKAGE_VERSION  O valor do campo `version` no package.json.
  #
  # typeset -g POWERLEVEL9K_PACKAGE_CONTENT_EXPANSION='${P9K_PACKAGE_NAME//\%/%%}@${P9K_PACKAGE_VERSION//\%/%%}'

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PACKAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ rvm: versão ruby do rvm (https://rvm.io) ]########################
  # Cor do Rvm.
  typeset -g POWERLEVEL9K_RVM_FOREGROUND=0
  typeset -g POWERLEVEL9K_RVM_BACKGROUND=240
  # Não mostra o @gemset no final.
  typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
  # Não mostra o prefixo ruby- na frente.
  typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ fvm: gerenciamento de versão flutter (https://github.com/leoafarias/fvm) ]############
  # Cor do Fvm.
  typeset -g POWERLEVEL9K_FVM_FOREGROUND=0
  typeset -g POWERLEVEL9K_FVM_BACKGROUND=4
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_FVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ luaenv: versão lua do luaenv (https://github.com/cehoffman/luaenv) ]###########
  # Cor do Lua.
  typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_LUAENV_BACKGROUND=4
  # Oculta a versão do lua se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do lua se for a mesma que a global.
  typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do lua se for igual a "system".
  typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ jenv: versão java do jenv (https://github.com/jenv/jenv) ]################
  # Cor do Java.
  typeset -g POWERLEVEL9K_JENV_FOREGROUND=1
  typeset -g POWERLEVEL9K_JENV_BACKGROUND=7
  # Oculta a versão do java se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do java se for a mesma que a global.
  typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do java se for igual a "system".
  typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ plenv: versão perl do plenv (https://github.com/tokuhirom/plenv) ]############
  # Cor do Perl.
  typeset -g POWERLEVEL9K_PLENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_PLENV_BACKGROUND=4
  # Oculta a versão do perl se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do perl se for a mesma que a global.
  typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do perl se for igual a "system".
  typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ perlbrew: versão perl do perlbrew (https://github.com/gugod/App-perlbrew) ]############
  # Cor do Perlbrew.
  typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND=67
  # Mostra a versão do perlbrew apenas quando estiver em um subdiretório de um projeto perl.
  typeset -g POWERLEVEL9K_PERLBREW_PROJECT_ONLY=true
  # Não mostra "perl-" na frente.
  typeset -g POWERLEVEL9K_PERLBREW_SHOW_PREFIX=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PERLBREW_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ phpenv: versão php do phpenv (https://github.com/phpenv/phpenv) ]############
  # Cor do PHP.
  typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_PHPENV_BACKGROUND=5
  # Oculta a versão do php se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do php se for a mesma que a global.
  typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do PHP se for igual a "system".
  typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PHPENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######[ scalaenv: versão scala do scalaenv (https://github.com/scalaenv/scalaenv) ]#######
  # Cor do Scala.
  typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND=0
  typeset -g POWERLEVEL9K_SCALAENV_BACKGROUND=1
  # Oculta a versão do scala se ela não vier de uma destas fontes.
  typeset -g POWERLEVEL9K_SCALAENV_SOURCES=(shell local global)
  # Se definido como false, oculta a versão do scala se for a mesma que a global.
  typeset -g POWERLEVEL9K_SCALAENV_PROMPT_ALWAYS_SHOW=false
  # Se definido como false, oculta a versão do scala se for igual a "system".
  typeset -g POWERLEVEL9K_SCALAENV_SHOW_SYSTEM=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_SCALAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ haskell_stack: versão haskell do stack (https://haskellstack.org/) ]###########
  # Cor do Haskell.
  typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=0
  typeset -g POWERLEVEL9K_HASKELL_STACK_BACKGROUND=3

  # Oculta a versão do haskell se ela não vier de uma destas fontes:
  #
  #   shell:  versão definida por STACK_YAML
  #   local:  versão definida por stack.yaml na árvore de diretórios
  #   global: versão definida pelo projeto global implícito (~/.stack/global-project/stack.yaml)
  typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
  # Se definido como false, oculta a versão do haskell se for a mesma do projeto global implícito.
  typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_HASKELL_STACK_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ terraform: workspace terraform (https://www.terraform.io) ]#################
  # Não mostra o workspace do terraform se for literalmente "default".
  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  # POWERLEVEL9K_TERRAFORM_CLASSES é um array com número par de elementos. O primeiro elemento
  # de cada par define um padrão contra o qual o workspace atual do terraform é comparado.
  # O segundo elemento define a classe do workspace. Os padrões são testados em ordem.

################[ terraform: terraform workspace (https://www.terraform.io) ]#################
  # Não mostra o workspace do terraform se for literalmente "default".
  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  # POWERLEVEL9K_TERRAFORM_CLASSES é um array com número par de elementos. O primeiro elemento
  # de cada par define um padrão contra o qual o workspace atual do terraform é comparado.
  # Mais especificamente, é o P9K_CONTENT antes da aplicação da expansão de contexto que é comparado.
  # Se você desativar todos os parâmetros POWERLEVEL9K_TERRAFORM_*CONTENT_EXPANSION,
  # verá este valor no seu prompt. O segundo elemento de cada par define a classe do workspace.
  # Os padrões são testados em ordem. O primeiro a corresponder vence.
  #
  # Por exemplo, com estas configurações:
  #
  #   typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
  #     '*prod*'  PROD
  #     '*test*'  TEST
  #     '*'       OTHER)
  #
  # Se o seu workspace atual for "project_test", a classe será TEST porque "project_test"
  # não corresponde a '*prod*', mas corresponde a '*test*'.
  #
  # Você pode definir cores, ícones e expansões de conteúdo diferentes para classes distintas:
  #
  #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_FOREGROUND=2
  #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_BACKGROUND=0
  #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
      # '*prod*'  PROD    # Estes valores são exemplos que dificilmente
      # '*test*'  TEST    # atenderão suas necessidades. Personalize-os conforme necessário.
      '*'         OTHER)
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=4
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND=0
  # typeset -g POWERLEVEL9K_TERRAFORM_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #############[ terraform_version: versão do terraform (https://www.terraform.io) ]##############
  # Cor da versão do Terraform.
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND=4
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TERRAFORM_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ terraform_version: Mostra a versão ativa do terraform ]#################
  # Mostra apenas quando um destes comandos for digitado.
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_SHOW_ON_COMMAND='terraform|tf'

  #############[ kubecontext: contexto atual do kubernetes (https://kubernetes.io/) ]#############
  # Mostra o kubecontext apenas quando o comando que você está digitando invoca uma destas ferramentas.
  # Dica: Remova a próxima linha para sempre mostrar o kubecontext.
  typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent'

  # Classes de contexto do Kubernetes para usar cores, ícones e expansões diferentes com contextos distintos.
  #
  # POWERLEVEL9K_KUBECONTEXT_CLASSES é um array com número par de elementos. O primeiro elemento
  # de cada par define um padrão contra o qual o contexto atual do kubernetes é comparado.
  # O segundo elemento define a classe do contexto. Os padrões são testados em ordem.
  #
  # Exemplo:
  #
  #   typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
  #     '*prod*'  PROD
  #     '*test*'  TEST
  #     '*'       DEFAULT)
  #
  # Se o contexto atual for "deathray-testing/default", a classe será TEST.
  #
  # Definição de estilos por classe:
  #
  #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=0
  #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_BACKGROUND=2
  #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      # '*prod*'  PROD    # Exemplos para personalizar conforme sua necessidade.
      # '*test*'  TEST
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=7
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=5
  # typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # Use POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION para especificar o conteúdo exibido.
  # As expansões de parâmetros são flexíveis e rápidas.
  #
  # Dentro da expansão, os seguintes parâmetros estão sempre disponíveis:
  #
  # - P9K_CONTENT                O conteúdo que seria exibido se não houvesse expansão definida.
  # - P9K_KUBECONTEXT_NAME       Nome do contexto atual (coluna NAME em `kubectl config get-contexts`).
  # - P9K_KUBECONTEXT_CLUSTER    Cluster do contexto atual (coluna CLUSTER).
  # - P9K_KUBECONTEXT_NAMESPACE  Namespace do contexto atual (coluna NAMESPACE). Se vazio, vira "default".
  # - P9K_KUBECONTEXT_USER       Usuário do contexto atual (coluna AUTHINFO).
  #
  # Se o contexto apontar para Google Kubernetes Engine (GKE) ou Elastic Kubernetes Service (EKS):
  #
  # - P9K_KUBECONTEXT_CLOUD_NAME     "gke" ou "eks".
  # - P9K_KUBECONTEXT_CLOUD_ACCOUNT  ID da conta/projeto.
  # - P9K_KUBECONTEXT_CLOUD_ZONE     Zona de disponibilidade.
  # - P9K_KUBECONTEXT_CLOUD_CLUSTER  Cluster.
  #
  # Exemplo GKE: gke_meu-projeto_us-east1-a_meu-cluster-01
  #   -> CLOUD_NAME=gke, CLOUD_ACCOUNT=meu-projeto, CLOUD_ZONE=us-east1-a, CLOUD_CLUSTER=meu-cluster-01
  #
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
  # Mostra P9K_KUBECONTEXT_CLOUD_CLUSTER se não estiver vazio, caso contrário mostra P9K_KUBECONTEXT_NAME.
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
  # Adiciona o namespace atual se não for "default".
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

# Prefixo personalizado.
  # typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='em '

  #[ aws: perfil aws (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
  # Mostra o aws apenas quando o comando que você está digitando invoca uma destas ferramentas.
  # Dica: Remova a próxima linha para sempre mostrar o aws.
  typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi|terragrunt'

  # POWERLEVEL9K_AWS_CLASSES é um array com número par de elementos. O primeiro elemento
  # de cada par define um padrão contra o qual o perfil AWS atual é comparado.
  # Mais especificamente, é o P9K_CONTENT antes da aplicação da expansão de contexto que é comparado.
  # Se você desativar todos os parâmetros POWERLEVEL9K_AWS_*CONTENT_EXPANSION,
  # verá este valor no seu prompt. O segundo elemento de cada par define a classe do perfil.
  # Os padrões são testados em ordem. O primeiro a corresponder vence.
  #
  # Exemplo:
  #
  #   typeset -g POWERLEVEL9K_AWS_CLASSES=(
  #     '*prod*'  PROD
  #     '*test*'  TEST
  #     '*'       DEFAULT)
  #
  # Se o seu perfil AWS atual for "company_test", a classe será TEST.
  #
  # Você pode definir cores, ícones e expansões de conteúdo diferentes para classes distintas:
  #
  #   typeset -g POWERLEVEL9K_AWS_TEST_FOREGROUND=28
  #   typeset -g POWERLEVEL9K_AWS_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_AWS_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  typeset -g POWERLEVEL9K_AWS_CLASSES=(
      # '*prod*'  PROD    # Estes valores são exemplos.
      # '*test*'  TEST    # Personalize-os conforme necessário.
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=7
  typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND=1
  # typeset -g POWERLEVEL9K_AWS_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # Formato do segmento AWS. Os seguintes parâmetros estão disponíveis na expansão:
  #
  # - P9K_AWS_PROFILE  O nome do perfil AWS atual.
  # - P9K_AWS_REGION   A região associada ao perfil AWS atual.
  typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\%/%%}}'

  #[ aws_eb_env: ambiente aws elastic beanstalk (https://aws.amazon.com/elasticbeanstalk/) ]#
  # Cor do ambiente AWS Elastic Beanstalk.
  typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=2
  typeset -g POWERLEVEL9K_AWS_EB_ENV_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_AWS_EB_ENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ azure: nome da conta azure (https://docs.microsoft.com/en-us/cli/azure) ]##########
  # Mostra o azure apenas quando o comando digitado invoca uma destas ferramentas.
  # Dica: Remova a próxima linha para sempre mostrar o azure.
  typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi|terragrunt'
  # Cor do nome da conta Azure.
  typeset -g POWERLEVEL9K_AZURE_FOREGROUND=7
  typeset -g POWERLEVEL9K_AZURE_BACKGROUND=4
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_AZURE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ gcloud: conta e projeto google cloud (https://cloud.google.com/) ]###########
  # Mostra o gcloud apenas quando o comando digitado invoca uma destas ferramentas.
  # Dica: Remova a próxima linha para sempre mostrar o gcloud.
  typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs|gsutil'
  # Cor do Google Cloud.
  typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=7
  typeset -g POWERLEVEL9K_GCLOUD_BACKGROUND=4

  # Formato do Google Cloud. Altere os valores abaixo se o padrão for muito verboso.
  # Você pode usar os seguintes parâmetros nas expansões (correspondem à saída da ferramenta `gcloud`):
  #
  #   Parâmetro                 | Origem
  #   -------------------------|--------------------------------------------------------------------
  #   P9K_GCLOUD_CONFIGURATION | gcloud config configurations list --format='value(name)'
  #   P9K_GCLOUD_ACCOUNT       | gcloud config get-value account
  #   P9K_GCLOUD_PROJECT_ID    | gcloud config get-value project
  #   P9K_GCLOUD_PROJECT_NAME  | gcloud projects describe $P9K_GCLOUD_PROJECT_ID --format='value(name)'
  #
  # Nota: Obter o nome do projeto requer uma requisição aos servidores do Google, o que pode demorar.
  # Quando o nome é desconhecido, o segmento fica no estado PARTIAL. Quando o nome é obtido,
  # ele transita para COMPLETE.
  #
  # Você pode ocultar o estado PARTIAL definindo as expansões de ícone e conteúdo como vazias.
  typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
  typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

  # Frequência de atualização do nome do projeto (em segundos).
  # Valor negativo desativa a atualização periódica.
  typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_GCLOUD_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #[ google_app_cred: credenciais de aplicação google (https://cloud.google.com/docs/authentication/production) ]#
  # Mostra o google_app_cred apenas quando o comando digitado invoca uma destas ferramentas.
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi|terragrunt'

  # Classes para credenciais de aplicação Google para usar cores e ícones diferentes.
  #
# POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES é um array com número par de elementos. O primeiro
  # elemento de cada par define um padrão contra o qual o contexto atual do kubernetes é
  # comparado. Mais especificamente, é o P9K_CONTENT antes da aplicação da expansão de contexto
  # que é comparado. Se você desativar todos os parâmetros POWERLEVEL9K_GOOGLE_APP_CRED_*CONTENT_EXPANSION,
  # verá este valor no seu prompt. O segundo elemento de cada par define a classe do contexto.
  # Os padrões são testados em ordem. O primeiro a corresponder vence.
  #
  # Exemplo:
  #
  #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
  #     '*:*prod*:*'  PROD
  #     '*:*test*:*'  TEST
  #     '*'           DEFAULT)
  #
  # Se suas credenciais atuais forem "service_account deathray-testing x@y.com",
  # a classe será TEST porque corresponde ao padrão '* *test* *'.
  #
  # Você pode definir cores, ícones e expansões de conteúdo diferentes para classes distintas:
  #
  #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_FOREGROUND=28
  #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_CONTENT_EXPANSION='$P9K_GOOGLE_APP_CRED_PROJECT_ID'
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
      # '*:*prod*:*'  PROD    # Exemplos para personalizar conforme sua necessidade.
      # '*:*test*:*'  TEST
      '*'             DEFAULT)
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=7
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND=4
  # typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # Use POWERLEVEL9K_GOOGLE_APP_CRED_CONTENT_EXPANSION para especificar o conteúdo exibido.
  # As expansões de parâmetros são flexíveis e rápidas.
  #
  # Você pode usar os seguintes parâmetros, que correspondem aos campos no arquivo JSON
  # apontado por GOOGLE_APPLICATION_CREDENTIALS.
  #
  #   Parâmetro                        | Campo no arquivo JSON
  #   ---------------------------------+---------------
  #   P9K_GOOGLE_APP_CRED_TYPE         | type
  #   P9K_GOOGLE_APP_CRED_PROJECT_ID   | project_id
  #   P9K_GOOGLE_APP_CRED_CLIENT_EMAIL | client_email
  #
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

  ##############[ toolbox: nome do toolbox (https://github.com/containers/toolbox) ]###############
  # Cor do Toolbox.
  typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND=0
  typeset -g POWERLEVEL9K_TOOLBOX_BACKGROUND=3
  # Não exibe o nome do toolbox se ele corresponder a fedora-toolbox-*.
  typeset -g POWERLEVEL9K_TOOLBOX_CONTENT_EXPANSION='${P9K_TOOLBOX_NAME:#fedora-toolbox-*}'
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TOOLBOX_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_TOOLBOX_PREFIX='em '

  ###############################[ public_ip: endereço IP público ]###############################
  # Cor do IP público.
  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=7
  typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ########################[ vpn_ip: indicador de rede privada virtual (VPN) ]#########################
  # Cor do IP da VPN.
  typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=0
  typeset -g POWERLEVEL9K_VPN_IP_BACKGROUND=6
  # Quando estiver em uma VPN, mostra apenas um ícone sem o endereço IP.
  # Dica: Para exibir o endereço IP privado na VPN, remova a próxima linha.
  typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
  # Expressão regular para a interface de rede VPN. Execute `ifconfig` ou `ip -4 a show`
  # enquanto estiver na VPN para ver o nome da interface.
  typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(gpd|wg|(.*tun)|tailscale)[0-9]*'
  # Se definido como true, mostra um segmento para cada interface de rede correspondente.
  # Se false, mostra apenas o primeiro.
  typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

###########[ ip: endereço ip e uso de banda para uma interface de rede específica ]###########
  # Cor do IP.
  typeset -g POWERLEVEL9K_IP_BACKGROUND=4
  typeset -g POWERLEVEL9K_IP_FOREGROUND=0
  # Os seguintes parâmetros estão acessíveis dentro da expansão:
  #
  #   Parâmetro             | Significado
  #   ----------------------+-------------------------------------------
  #   P9K_IP_IP             | Endereço IP
  #   P9K_IP_INTERFACE      | Interface de rede
  #   P9K_IP_RX_BYTES       | Número total de bytes recebidos
  #   P9K_IP_TX_BYTES       | Número total de bytes enviados
  #   P9K_IP_RX_BYTES_DELTA | Bytes recebidos desde o último prompt
  #   P9K_IP_TX_BYTES_DELTA | Bytes enviados desde o último prompt
  #   P9K_IP_RX_RATE        | Taxa de recebimento (desde o último prompt)
  #   P9K_IP_TX_RATE        | Taxa de envio (desde o último prompt)
  typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='${P9K_IP_RX_RATE:+⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+⇡$P9K_IP_TX_RATE }$P9K_IP_IP'
  # Mostra informações para a primeira interface cujo nome corresponda a esta expressão regular.
  # Execute `ifconfig` ou `ip -4 a show` para ver os nomes de todas as interfaces.
  typeset -g POWERLEVEL9K_IP_INTERFACE='[ew].*'
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #########################[ proxy: proxy http/https/ftp do sistema ]##########################
  # Cor do Proxy.
  typeset -g POWERLEVEL9K_PROXY_FOREGROUND=4
  typeset -g POWERLEVEL9K_PROXY_BACKGROUND=0
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################################[ battery: bateria interna ]#################################
  # Mostra a bateria em vermelho quando estiver abaixo deste nível e fora da tomada.
  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=1
  # Mostra a bateria em verde quando estiver carregando ou totalmente carregada.
  typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=2
  # Mostra a bateria em amarelo quando estiver descarregando.
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=3
  # Pictogramas de bateria do nível baixo ao alto.
  typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
  # Não mostra o tempo restante para carregar/descarregar.
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false
  typeset -g POWERLEVEL9K_BATTERY_BACKGROUND=0

  #####################################[ wifi: velocidade do wifi ]#####################################
  # Cor do WiFi.
  typeset -g POWERLEVEL9K_WIFI_FOREGROUND=0
  typeset -g POWERLEVEL9K_WIFI_BACKGROUND=4
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # Use cores e ícones diferentes dependendo da força do sinal ($P9K_WIFI_BARS).
  #
  #   # Cores e ícones para diferentes níveis de sinal (baixo para alto).
  #   typeset -g my_wifi_fg=(0 0 0 0 0)                                # <-- altere estes valores
  #   typeset -g my_wifi_icon=('WiFi' 'WiFi' 'WiFi' 'WiFi' 'WiFi')     # <-- altere estes valores
  #
  #   typeset -g POWERLEVEL9K_WIFI_CONTENT_EXPANSION='%F{${my_wifi_fg[P9K_WIFI_BARS+1]}}$P9K_WIFI_LAST_TX_RATE Mbps'
  #   typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION='%F{${my_wifi_fg[P9K_WIFI_BARS+1]}}${my_wifi_icon[P9K_WIFI_BARS+1]}'
  #
  # Parâmetros acessíveis:
  #
  #   Parâmetro             | Significado
  #   ----------------------+---------------
  #   P9K_WIFI_SSID         | Nome da rede (SSID)
  #   P9K_WIFI_LINK_AUTH    | Protocolo de autenticação (ex: "wpa2-psk")
  #   P9K_WIFI_LAST_TX_RATE | Taxa de transmissão em Mbps
  #   P9K_WIFI_RSSI         | Força do sinal em dBm (-120 a 0)
  #   P9K_WIFI_NOISE        | Ruído em dBm (-120 a 0)
  #   P9K_WIFI_BARS         | Força do sinal em barras (0 a 4)

  ####################################[ time: hora atual ]####################################
  # Cor da hora atual.
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=7
  # Formato para a hora atual: 09:51:02. Veja `man 3 strftime`.
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  # Se true, a hora atualizará ao apertar enter. Assim, prompts de comandos passados
  # conterão o horário de início do comando em vez do horário de término do anterior.
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
  # Ícone personalizado.
  # typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Prefixo personalizado.
  # typeset -g POWERLEVEL9K_TIME_PREFIX='em '

  # Exemplo de um segmento de prompt definido pelo usuário. A função prompt_example será
  # chamada em cada prompt se o segmento `example` for adicionado aos elementos.
  # Ela exibe um ícone e texto amarelo sobre fundo vermelho saudando o usuário.
  #
  # Digite `p10k help segment` para documentação e exemplos mais sofisticados.
  function prompt_example() {
    p10k segment -b 1 -f 3 -i '⭐' -t 'olá, %n'
  }

# Segmentos de prompt definidos pelo usuário podem opcionalmente fornecer uma função
  # instant_prompt_*. O seu trabalho é gerar o segmento para exibição no "instant prompt".
  # Veja: https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
  #
  # O Powerlevel10k chamará instant_prompt_* ao mesmo tempo que a função regular prompt_* # e gravará todas as chamadas `p10k segment` que ela fizer. Ao exibir o instant prompt,
  # o Powerlevel10k repetirá essas chamadas sem realmente chamar instant_prompt_* de novo.
  # É imperativo que instant_prompt_* faça sempre as mesmas chamadas `p10k segment`,
  # independentemente do ambiente. Se essa regra não for seguida, o conteúdo do
  # instant prompt ficará incorreto.
  #
  # Geralmente, você não deve definir instant_prompt_* ou simplesmente chamar prompt_* dentro dela.
  # Se instant_prompt_* não for definida para um segmento, ele não aparecerá no instant prompt.
  function instant_prompt_example() {
    # Como prompt_example sempre faz as mesmas chamadas `p10k segment`, podemos chamá-la
    # de dentro de instant_prompt_example. Isso nos dará o mesmo segmento `example`
    # tanto no instant prompt quanto no prompt regular.
    prompt_example
  }

  # Segmentos definidos pelo usuário podem ser personalizados da mesma forma que os integrados.
  typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=3
  typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND=1
  # typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # O Prompt Transiente funciona de forma semelhante à opção builtin transient_rprompt.
  # Ele "limpa" ou reduz o prompt ao aceitar um comando digitado. Valores suportados:
  #
  #   - off:      Não altera o prompt ao aceitar um comando.
  #   - always:   Reduz o prompt ao aceitar um comando.
  #   - same-dir: Reduz o prompt ao aceitar um comando, a menos que seja o primeiro
  #               comando digitado após mudar o diretório de trabalho atual.
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  # Modo Instant Prompt.
  #
  #   - off:     Desativa o instant prompt. Escolha isso se você tentou o instant prompt
  #              e achou incompatível com seus arquivos de configuração do zsh.
  #   - quiet:   Ativa o instant prompt e não exibe avisos ao detectar saída no console
  #              durante a inicialização do zsh.
  #   - verbose: Ativa o instant prompt e exibe um aviso ao detectar saída no console durante a inicialização do zsh. Escolha este se você nunca tentou o instant prompt ou não tem certeza do que isso significa.
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # O Hot Reload permite alterar as opções POWERLEVEL9K após o Powerlevel10k ter sido inicializado.
  # Por exemplo, você pode digitar POWERLEVEL9K_BACKGROUND=red e ver seu prompt ficar vermelho.
  # O hot reload pode deixar o prompt mais lento em 1-2 milissegundos, por isso é melhor
  # mantê-lo desativado, a menos que você realmente precise dele.
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # Se o p10k já estiver carregado, recarrega a configuração.
  # Isso funciona mesmo com POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
  (( ! $+functions[p10k] )) || p10k reload
}

# Informa ao `p10k configure` qual arquivo ele deve sobrescrever.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
