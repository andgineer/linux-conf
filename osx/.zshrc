eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export PROGRESS_NO_TRUNC=1
export BUILDKIT_STEP_LOG_MAX_SIZE=-1
export BUILDKIT_STEP_LOG_MAX_TOTAL=-1
export BUILDKIT_PROGRESS=plain

export AWS_PROFILE=dev
export AWS_PAGER=""
export AWS_REGION="eu-west-1"

export LDFLAGS="-L/opt/homebrew/opt/freetds/lib -L/opt/homebrew/opt/openssl@3/lib"
export CFLAGS="-I/opt/homebrew/opt/freetds/include"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

source ~/.garminsecrets
alias ls="eza -lah"

eval $(luarocks path)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
export DEFAULT_USER=`whoami`

# Alt-left/righ arrow move by word
bindkey '[C' forward-word
bindkey '[D' backward-word

# Alt-Shift-left delete a full WORD (including colon, dot, comma, quotes...)
# Too often I press Cmd-W instead of Ctrl-W so I prefer non-standard combination
my-backward-kill-word () {
      # Add colon, comma, single/double quotes to word chars
      local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>:,"'"'"
      zle -f kill # Append to the kill ring on subsequent kills.
      zle backward-kill-word
}
zle -N my-backward-kill-word
bindkey '^[[1;10D' my-backward-kill-word

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
eval "$(mcfly init zsh)"

# Created by `pipx` on 2023-02-21 13:37:54
export PATH="$PATH:/Users/<WHOAMI>/.local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function dockerprune {
    docker system prune --force -a --filter "until=24h"
    docker volume prune --force -a --filter "until=24h"
    docker image prune --force -a --filter "until=24h"
}

function dockerkill {
    docker system prune -a --volumes
}

eval "$(saml2aws --completion-script-zsh)"
export PATH="$(pyenv root)/shims:/usr/local/opt/libpq/bin:$PATH"

function git-remote() {
    # Check if inside a git repository
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Not inside a Git repository!"
        return 1
    fi

    # Extract the current push URL for origin
    push_url=$(git remote get-url --push origin)

    # Check if the URL contains "github.com"
    if [[ $push_url == *git@github.com* ]]; then
        # Construct the new URL by replacing "github.com" with "github-and"
        new_push_url="${push_url/git@github.com/git@github-and}"

        # Set the new push URL
        git remote set-url origin --push "$new_push_url"
        echo "Push URL changed to $new_push_url"
    else
        echo "Push URL does not contain 'git@github.com'. No changes made."
    fi
}
eval "$(rbenv init - zsh)"