#!/usr/bin/env bash
# shellcheck source=/dev/null

export ZSH_DOT_MAD="${HOME}/git/dot-scripts-templates/zsh"
source "${ZSH_DOT_MAD}/_index"

if [ -z "${SSH_TTY}" ]; then
    source "${ZSH_DOT_MAD}/.autorunrc"
fi
