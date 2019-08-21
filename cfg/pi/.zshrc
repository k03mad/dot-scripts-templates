#!/usr/bin/env zsh

source ~/git/dot-scripts-templates/cfg/_index
source ~/.keyrc

if [ -z "$SSH_TTY" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
