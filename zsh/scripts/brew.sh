#!/usr/bin/env zsh

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/command-not-found
brew tap jandedobbeleer/oh-my-posh

tools=(
    android-platform-tools
    aria2
    # bettercap
    ccat
    curl
    findutils
    font-fira-code-nerd-font
    git
    glances
    htop
    httpie
    hub
    id3v2
    jq
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
)

brew install "${tools[@]}"
