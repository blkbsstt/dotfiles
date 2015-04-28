#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

launchctl setenv PATH $PATH

# Alias for quicklooking a file
alias ql='qlmanage -p "$@" > /dev/null 2>&1'

export EDITOR=vim
export VISUAL=vim

export PAGER=vimpager
alias less=$PAGER
alias zless=$PAGER
alias vcat=vimcat
alias cs498="mosh cs498 -- tmux attach || tmux new"
alias ssh498="ssh cs498 -t -- tmux attach || tmux new"

alias rainbow="xxd -ps -c $(expr $(tput cols) / 2) /dev/zero | sed s/0/█/g | lolcat"

setopt VI

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo
bindkey -M viins ' ' magic-space

KEYTIMEOUT=1

autoload -U age

eval "$(rbenv init -)"
