#!/usr/bin/env bash

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
    mosh
    nano
    ncdu
    peco
    ranger
    shellcheck
    tldr
    topgrade
    tree
    wget
    zsh
    zsh-completions
)

brew install "${termTools[@]}"
