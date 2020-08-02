#!/usr/bin/env zsh

aptTools=(
    aria2
    bat
    curl
    git
    glances
    htop
    hub
    id3v2
    jq
    mc
    micro
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

for i in "${aptTools[@]}"
do
    if [ -z "${NO_SUDO}" ]; then
        sudo apt-get install "$i"
    else
        apt-get install "$i"
    fi
done
