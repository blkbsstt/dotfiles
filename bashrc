PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/share/python:$PATH
launchctl setenv PATH $PATH
EDITOR=vim; export EDITOR
VISUAL=vim; export VISUAL

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias rm="grm -I"
alias ls="gls --color=auto"
alias l="ls -F"
alias la="l -A"
alias ll="l -lh"
alias lla="ll -A"
alias x="clear"
alias s="sudo "
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ..."
alias mkdir="mkdir -pv"
eval "$(fasd --init auto)"
alias v="f -e vim"
alias o="a -e open"
alias rainbow="xxd -ps -c $(expr $(tput cols) / 2) /dev/zero | sed s/0/█/g | lolcat"
alias sl="ls"

PROMPT_COMMAND="history 1 | sed 's/[^0-9]*\([0-9]*\).*/\1/' > ~/.hist_tmp"

shopt -s histappend

. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

. ~/.profile
