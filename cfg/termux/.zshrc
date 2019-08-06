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

# utils

chpwd() {
    ls
}

# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
~/git/ubuntu-in-termux/.start.sh