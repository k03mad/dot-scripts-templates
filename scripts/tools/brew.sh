#!/usr/bin/env bash

termTools=(
    aria2
    bat
    curl
    git
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
