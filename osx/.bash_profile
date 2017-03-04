export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH="$PATH:"/Applications/microchip/xc8/v1.41/bin""

# added by Anaconda3 4.3.0 installer
#export PATH="/Users/andrejsorokin/anaconda/bin:$PATH"

function tmuxer ()
{
tmux attach -t base || tmux new -s base
}

function confsaver () {
CONFDEST=~/Projects/linux-conf/osx
cp ~/.tmux.conf $CONFDEST
cp ~/.bash_profile $CONFDEST
cp ~/.zshrc $CONFDEST
}
