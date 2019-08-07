# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
source ~/.keyrc

# utils

chpwd() {
    lls
}

eval $(thefuck --alias)

# autorun

if [ -z "$SSH_TTY" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
