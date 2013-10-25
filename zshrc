alias sz="source ~/.zshrc"

# Powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
PATH=/usr/local/share/python:$PATH

# fasd
eval "$(fasd --init auto)"
alias v="f -e vim"
alias o="a -e open"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

launchctl setenv PATH $PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/maude++:$PATH

PAGER=vimpager; export PAGER
alias less=$PAGER
alias zless=$PAGER
alias vcat=vimcat

EDITOR=vim; export EDITOR
VISUAL=vim; export VISUAL

# History
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=0
function precmd {
    HISTLAST=`fc -l -1 | sed -e 's/^ *//' -e 's/ *$//g'`
    HISTLEN=`echo $HISTLAST | sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    if [[ $HISTLAST == $HISTLEN ]]; then
        echo 0 > ~/.hist_tmp
    else
        echo $HISTLEN > ~/.hist_tmp
    fi
}

# completion
autoload -U compinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# suffix aliases
autoload -U zsh-mime-setup
zsh-mime-setup

alias -s rb=ruby
alias -s pdf=open
alias -s tex=vim

# 'dir' -> 'cd dir'
setopt AUTO_CD

# 'cd' -> 'pushd'
setopt AUTO_PUSHD

setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS

# 10 sec wait if deleting everything?
setopt RM_STAR_WAIT

alias ls="gls --color=auto"
alias l="ls -F"
alias la="l -A"
alias ll="l -lh"
alias lla="ll -A"
alias sl="ls"

alias mkdir="mkdir -pv"
alias c="clear"

alias b="popd"
alias k="popd"

alias rainbow="xxd -ps -c $(expr $(tput cols) / 2) /dev/zero | sed s/0/█/g | lolcat"

setopt VI

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo
bindkey -M viins ' ' magic-space

KEYTIMEOUT=1

autoload -U age
