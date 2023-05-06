ZSH_THEME="agnoster"
export DEFAULT_USER=`whoami`
export ZSH_DISABLE_COMPFIX=true

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

plugins=(git tmux tmuxinator fasd pip virtualenv)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status virtualenv)

source $ZSH/oh-my-zsh.sh
source ~/.garminsecrets
alias ls="exa -lah"

bindkey '[C' forward-word
bindkey '[D' backward-word

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

function dockerhubrefresh {
    for image in python python-base matplotlib iot-calendar openhab-synology allure amazon-dash-button-hack; do
      docker pull andgineer/$image
      docker image rm andgineer/$image
    done
}

function dockerstop {
     docker stop $(docker ps -a -q)
}

function dockerprune {
    docker system prune --force -a --filter "until=24h"
    docker volume prune --force -a --filter "until=24h"
    docker image prune --force -a --filter "until=24h"
}

function sju {
    ssh -L 9090:localhost:9090 remotehost_with_jupyter
}

function unsetproxy {
	unset  https_proxy
	unset  http_proxy
	unset  no_proxy
	unset  HTTPS_PROXY
	unset  HTTP_PROXY
	unset  NO_PROXY
}

function setproxy {
	export HTTPS_PROXY="***"
	export {HTTP_PROXY,http_proxy,https_proxy}="${HTTPS_PROXY}"
	export {NO_PROXY,no_proxy}="localhost,127.0.0.1"
}