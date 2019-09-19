#!/usr/bin/env zsh

source ~/git/dot-scripts-templates/cfg/_index

if [ -z "${SSH_TTY}" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
