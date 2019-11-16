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
    shellcheck
    tig
    tldr
    topgrade
    wget
    zsh
)

brew install "${termTools[@]}"
