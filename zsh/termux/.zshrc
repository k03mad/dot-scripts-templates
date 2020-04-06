#!/usr/bin/env bash
# shellcheck source=/dev/null

export SKIP_NVRMC=true
export SKIP_LOCALE=true

export ZSH_DOT_MAD="${HOME}/git/dot-scripts-templates/zsh"
source "${ZSH_DOT_MAD}/_index"

alias sudo=""
