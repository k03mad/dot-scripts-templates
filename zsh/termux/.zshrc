#!/usr/bin/env zsh
# shellcheck source=/dev/null

export SKIP_NVRMC=true
export NO_SUDO=true

export ZSH_DOT_MAD="${HOME}/git/dot-scripts-templates/zsh"
source "${ZSH_DOT_MAD}/_index"
