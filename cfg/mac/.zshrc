# zsh

export ZSH=~/.oh-my-zsh

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
prompt pure
PROMPT='%(?.%F{magenta}.%F{red}!%F{magenta})>%f '
PURE_CMD_MAX_EXEC_TIME=0

# utils

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

# paths

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH

# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
source ~/.keyrc
