# Configuração do ZSH (~/.zshrc)
# Gerenciado via Oh My Zsh com tema Powerlevel10k

### INSTANT PROMPT (P10K) ###
# Ativa o carregamento instantâneo do terminal. Deve ficar no topo do arquivo.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### CAMINHOS E NÚCLEO (CORE) ###
export ZSH="$HOME/.oh-my-zsh"
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### TEMA (THEME) ###
# Para configurar o visual, execute: `p10k configure`
ZSH_THEME="powerlevel10k/powerlevel10k"

### CONFIGURAÇÕES DO OH MY ZSH ###

# CASE_SENSITIVE="true"                # Diferenciar maiúsculas/minúsculas no autocompletar
# HYPHEN_INSENSITIVE="true"            # Ignorar hifens (-) e underscores (_) no completar
# DISABLE_AUTO_UPDATE="true"           # Desativar verificação automática de atualização
# zstyle ':omz:update' frequency 13    # Frequência de atualização (em dias)
# DISABLE_MAGIC_FUNCTIONS="true"       # Evitar problemas ao colar URLs e textos longos
# DISABLE_LS_COLORS="true"             # Desativar cores no comando 'ls'
# DISABLE_AUTO_TITLE="true"            # Impedir o zsh de alterar o título do terminal
# ENABLE_CORRECTION="true"             # Ativar correção automática de comandos
# COMPLETION_WAITING_DOTS="true"       # Exibir pontos vermelhos enquanto aguarda completar

### PLUGINS ###
# Localização: $ZSH/plugins/ ou $ZSH_CUSTOM/plugins/
# CUIDADO: Muitos plugins podem deixar a inicialização do shell lenta.
plugins=(
    git
    zsh-autosuggestions
    # zsh-syntax-highlighting
)

# Carrega o Oh My Zsh
source $ZSH/oh-my-zsh.sh

### CONFIGURAÇÕES DE USUÁRIO ###

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8

# Editor padrão (Local vs SSH)
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

### ALIASES ###

alias download-video="yt-dlp"
alias download-audio="yt-dlp -f 'ba' -x --audio-format mp3"
alias info="fastfetch"
# alias zshconfig="nvim ~/.zshrc"

### FINALIZAÇÃO ###

# Carrega a configuração específica do Powerlevel10k, se existir.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
