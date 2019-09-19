#!/usr/bin/env bash
# shellcheck source=/dev/null

export PATH=/data/data/com.termux/files/usr/bin:$PATH
export PATH=/data/data/com.termux/files/usr/bin/applets:$PATH

export ZSH_DOT_MAD="${HOME}/git/dot-scripts-templates/zsh"
source "${ZSH_DOT_MAD}/_index"

alias sudo=""
