#!/usr/bin/env bash
# shellcheck source=/dev/null

export PATH=/usr/local/bin:${PATH}
export PATH=/usr/local/sbin:${PATH}
export PATH=/usr/local/opt/curl/bin:${PATH}

export ZSH_DOT_MAD="${HOME}/git/dot-scripts-templates/zsh"
source "${ZSH_DOT_MAD}/_index"
