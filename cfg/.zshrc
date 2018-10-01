# zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
export UPDATE_ZSH_DAYS=1
DISABLE_UPDATE_PROMPT="true"

plugins=(
    autoupdate
    fast-syntax-highlighting
    zsh-autosuggestions
    zsh-nvm
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=">"
prompt pure

# my

alias cat=ccat

download() {
    aria2c "$@" --file-allocation=falloc --max-connection-per-server=3 --split=3 --max-tries=0 --retry-wait=5 --continue --remote-time;
}

chpwd() {
    ls
    if [ "$PWD" != "$PREV_PWD" ]; then
        PREV_PWD="$PWD"
        if [ -e ".nvmrc" ]; then
            nvm install "$(cat .nvmrc)" --reinstall-packages-from=node
        fi
    fi
}

export PATH=/usr/local/bin:$PATH
export PATH=$(brew --prefix curl)/bin:$PATH
