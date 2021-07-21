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
    # nmap
    shellcheck
    tig
    tree
    unzip
    wget
    youtube-dl
    zsh
)

for i in "${aptTools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    if [ -n "${NO_SUDO}" ]; then
        apt-get -y install "$i"
    else
        sudo apt-get -y install "$i"
    fi
done
