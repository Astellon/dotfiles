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

# setting for hyper-tab-icons-plus (https://github.com/zeit/hyper/issues/1188)

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)

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
