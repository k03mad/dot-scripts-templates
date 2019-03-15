#!/bin/bash

termTools=(
    aria2
    bat
    ccat
    coreutils
    curl
    exa
    git
    httpie
    id3v2
    jq
    m-cli
    mas
    mc
    micro
    mkvdts2ac3
    nano
    ncdu
    peco
    ranger
    shellcheck
    tldr
    tree
    wget
    zsh
    zsh-completions
)

for i in "${termTools[@]}"
do
    brew install "$i"
done
