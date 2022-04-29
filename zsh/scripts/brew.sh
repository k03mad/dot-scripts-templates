#!/usr/bin/env zsh

taps=(
    homebrew/cask-fonts
    homebrew/cask-versions
    homebrew/cask-drivers
    homebrew/command-not-found
    jandedobbeleer/oh-my-posh
)

tools=(
    android-platform-tools
    aria2
    # bettercap
    ccat
    curl
    findutils
    font-fira-code-nerd-font
    fzf
    git
    gping
    htop
    httpie
    hub
    id3v2
    jq
    maven@3.5
    m-cli
    mc
    micro
    mkvdts2ac3
    mosh
    nano
    ncdu
    neofetch
    oh-my-posh
    # nmap
    shellcheck
    tig
    the_silver_searcher
    topgrade
    tree
    wget
    youtube-dl
    zsh
    MisterTea/et/et
    ycd/tap/dstp
)

printf "✨ %s\n" "${taps[@]}"
brew tap "${taps[@]}"

printf "✨ %s\n" "${tools[@]}"
brew install "${tools[@]}"
