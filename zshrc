alias cs498="mosh cs498 -- tmux attach || tmux new"
alias ssh498="ssh cs498 -t -- tmux attach || tmux new"

alias rainbow="xxd -ps -c $(expr $(tput cols) / 2) /dev/zero | sed s/0/█/g | lolcat"

if [ ! -e ~/.antigen.zsh ]; then
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
fi
source ~/.antigen.zsh

antigen use oh-my-zsh

antigen theme kphoen

antigen bundle git
antigen bundle svn
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle ssh-agent

antigen bundle pip
antigen bundle python
antigen bundle virtualenv

antigen bundle command-not-found
antigen bundle fasd

antigen bundle vi-mode
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo
bindkey -M viins ' ' magic-space
KEYTIMEOUT=1

# OS specific settings
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx

    # Alias for quicklooking a file
    alias ql='qlmanage -p "$@" > /dev/null 2>&1'
    launchctl setenv PATH $PATH
elif [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen apply

eval "$(rbenv init -)"
