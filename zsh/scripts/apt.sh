#!/usr/bin/env zsh

tools=(
    aria2
    curl
    fzf
    git
    htop
    hub
    id3v2
    jq
    libssl-dev
    mc
    micro
    mosh
    nano
    ncdu
    neofetch
    # nmap
    pkg-config
    shellcheck
    tig
    tree
    unzip
    wget
    youtube-dl
    zsh
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    if [ -n "${NO_SUDO}" ]; then
        apt-get -y install "$i"
    else
        sudo apt-get -y install "$i"
    fi
done
