ZSH_THEME="agnoster"
export DEFAULT_USER=`whoami`
export ZSH_DISABLE_COMPFIX=true

plugins=(git tmux tmuxinator fasd pip virtualenv)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status virtualenv)

source $ZSH/oh-my-zsh.sh

export EDITOR='micro'

__conda_setup="$('/Library/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Library/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Library/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Library/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.8.3/sbin"
epmd -kill

# shows app that listens to the port
function port-proc {
    readonly port=${1:?"The port must be specified."}

    lsof -nP -iTCP:"$port" | grep LISTEN
}

