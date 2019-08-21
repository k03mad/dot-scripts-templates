#!/usr/bin/env zsh

fpath+=("$NVM_DIR/versions/node/$(node -v)/lib/node_modules/pure-prompt/functions")

source ~/git/dot-scripts-templates/cfg/_index
source ~/.keyrc

if [ -z "$SSH_TTY" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
