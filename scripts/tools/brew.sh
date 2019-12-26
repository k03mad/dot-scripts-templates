#!/usr/bin/env bash

termTools=(
    aria2
    bat
    ccat
    curl
    exa
    git
    glances
    id3v2
    jq
    m-cli
    mc
    mkvdts2ac3
    mosh
    nano
    ncdu
    neofetch
    shellcheck
    tig
    tldr
    topgrade
    wget
    youtube-dl
    zsh
)

brew install "${termTools[@]}"
