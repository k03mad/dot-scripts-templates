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

# prompt

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=">"
prompt pure

# downloaders

ARIA_ARGS=(--file-allocation=falloc --max-connection-per-server=3 --split=3 --max-tries=0 --retry-wait=5 --continue --remote-time)

download() {
    aria2c "$@" "${ARIA_ARGS[@]}"
}

youtube() {
    youtube-dl --verbose -o "youtube-dl/%(uploader)s - %(title)s.%(ext)s" --add-metadata --embed-subs --external-downloader aria2c --external-downloader-args "$(echo ${ARIA_ARGS[@]})" "$@"
}

# others

chpwd() {
    exa -al --group-directories-first
    if [ "$PWD" != "$PREV_PWD" ]; then
        PREV_PWD="$PWD"
        if [ -e ".nvmrc" ]; then
            nvm install
        fi
    fi
}

eval $(thefuck --alias)

alias nvmclean="rm -rfv \$(ls -td \$NVM_DIR/versions/node/* | tail -n +2) && rm -rfv \$NVM_DIR/.cache/bin"

export PATH=/usr/local/bin:$(brew --prefix curl)/bin:$PATH
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8

source ~/.keyrc
