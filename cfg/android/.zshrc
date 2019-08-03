# zsh

export PATH=/data/data/com.termux/files/usr/bin:$PATH
export PATH=/data/data/com.termux/files/usr/bin/applets:$PATH
export ZSH=~/.oh-my-zsh

ZSH_THEME="avit"
export UPDATE_ZSH_DAYS=1
DISABLE_UPDATE_PROMPT="true"

plugins=(
    autoupdate
    fast-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# downloaders

ARIA_ARGS=(--file-allocation=falloc --max-connection-per-server=3 --max-concurrent-downloads=3 --split=3 --max-tries=120 --retry-wait=5 --continue --remote-time)

download() {
    aria2c "$@" "${ARIA_ARGS[@]}"
}

# utils

chpwd() {
    ls
}

# aliases

alias st="speed-test -b -v"

# others

export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8
