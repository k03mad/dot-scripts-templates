#!/usr/bin/env zsh

termTools=(
    aria2
    bat
    bettercap
    ccat
    curl
    exa
    git
    glances
    htop
    httpie
    hub
    id3v2
    jq
    lsd
    m-cli
    mc
    micro
    mkvdts2ac3
    mosh
    nano
    ncdu
    neofetch
    nmap
    shellcheck
    tig
    tldr
    topgrade
    tree
    wget
    youtube-dl
    zsh
)

brew install "${termTools[@]}"
