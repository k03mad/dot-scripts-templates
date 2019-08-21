#!/usr/bin/env zsh

export PATH=/data/data/com.termux/files/usr/bin:$PATH
export PATH=/data/data/com.termux/files/usr/bin/applets:$PATH

fpath+=("/data/data/com.termux/files/usr/lib/node_modules/pure-prompt/functions")

source ~/git/dot-scripts-templates/cfg/_index

alias sudo=""
alias ubuntu="~/git/ubuntu-in-termux/start.sh"
