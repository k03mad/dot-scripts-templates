# zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
export UPDATE_ZSH_DAYS=1
DISABLE_UPDATE_PROMPT="true"

plugins=(
    autoupdate
    fast-syntax-highlighting
    k
    zsh-autosuggestions
    zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# prompt

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=">"
prompt pure

# my

download() {
    aria2c "$@" --file-allocation=falloc --max-connection-per-server=3 --split=3 --max-tries=0 --retry-wait=5 --continue --remote-time;
}

chpwd() {
    exa -al --group-directories-first
    if [ "$PWD" != "$PREV_PWD" ]; then
        PREV_PWD="$PWD"
        if [ -e ".nvmrc" ]; then
            nvm install "$(cat .nvmrc)"
        fi
    fi
}

alias nvmclean="rm -rfv \$(ls -td \$NVM_DIR/versions/node/* | tail -n +2) && rm -rfv \$NVM_DIR/.cache/bin"

export PATH=/usr/local/bin:$(brew --prefix curl)/bin:$PATH
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8

source ~/.keyrc
