#!/usr/bin/env zsh

source ~/git/dot-scripts-templates/cfg/_index

fpath+=("$NVM_DIR/versions/node/$(node -v)/lib/node_modules/pure-prompt/functions")

if [ -z "$SSH_TTY" ]; then
    source ~/git/dot-scripts-templates/cfg/pi/.autorunrc
fi
