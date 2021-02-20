#!/usr/bin/env zsh

termTools=(
    aria2
    bat
    bettercap
    ccat
    curl
    exa
    findutils
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
    pyenv
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
