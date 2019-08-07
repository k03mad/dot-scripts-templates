# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
source ~/.keyrc

# utils

chpwd() {
    lls

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
