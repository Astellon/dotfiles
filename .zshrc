# terminal
TERM=xterm

# zplug
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "supercrabtree/k"
zplug "mafredri/zsh-async", from:github
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# install plugins
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

autoload -Uz compinit && compinit
autoload -Uz colors && colors

autoload -U promptinit; promptinit
prompt spaceship

#zstyles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2

# setopt

setopt autol_ist
setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt complete_in_word  
setopt nobeep 
setopt pushd_ignore_dups

# aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'
alias -g C='| cat'

# for Mac
case ${OSTYPE} in
  darwin*)
    alias l='ls -la -G'
    alias ls='ls -G'
    ;;
  linux*)
    alias l='ls -la --color'
    alias ls='ls --color'
    ;;
esac

alias gt='git'
alias gti='git'
alias gs='git status'
alias ga='git add .'
alias gdj='git diff --color-words=$'\''[^\x80-\xbf][\x80-\xbf]*'\'''
alias cat='bat'
