#!/usr/bin/env bash
# shellcheck source=/dev/null

source "${ZSH_DOT_MAD}/_index"

if [ -z "${SSH_TTY}" ]; then
    source "${ZSH_DOT_MAD}/pi/.autorunrc"
fi
