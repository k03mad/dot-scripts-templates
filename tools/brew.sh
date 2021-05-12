#!/usr/bin/env zsh

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/command-not-found

tools=(
    #
    # CLI
    #
    android-platform-tools
    aria2
    bat
    # bettercap
    ccat
    curl
    exa
    findutils
    font-fira-code-nerd-font
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
    # nmap
    pyenv
    shellcheck
    tig
    tldr
    topgrade
    tree
    wget
    youtube-dl
    zsh
    #
    # GUI
    #
    android-file-transfer
    appcleaner
    balenaetcher
    caramba-switcher
    eul
    firefox
    google-chrome
    keepingyouawake
    omnidisksweeper
    openoffice
    pritunl
    responsively
    tableplus
    teamviewer
    telegram-desktop
    the-unarchiver
    toinane-colorpicker
    transmission
    visual-studio-code
    vlc
    yandex
    yandex-disk
    zoom
)

brew install "${tools[@]}"
