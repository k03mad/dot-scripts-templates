# sources

source ~/git/dot-scripts-templates/cfg/.commonrc
source ~/.keyrc

if [ -z "$SSH_TTY" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
