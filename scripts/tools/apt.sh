#!/usr/bin/env zsh

aptTools=(
    aria2
    curl
    git
    glances
    htop
    hub
    id3v2
    jq
    mc
    mosh
    nano
    ncdu
    neofetch
    nmap
    shellcheck
    tig
    tldr
    tree
    wget
    youtube-dl
    zsh
)

sudo apt-get install "${aptTools[@]}" | apt-get install "${aptTools[@]}"
