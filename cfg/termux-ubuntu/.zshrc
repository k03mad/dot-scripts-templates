# updates

apt-get update
apt-get upgrade

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

fpath+=("$NVM_DIR/versions/node/$(node -v)/lib/node_modules/pure-prompt/functions")
autoload -U promptinit; promptinit
prompt pure
PROMPT='%(?.%F{magenta}.%F{red}!%F{magenta})>%f '
PURE_CMD_MAX_EXEC_TIME=0

# utils

chpwd() {
    ls -alh
}

# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
