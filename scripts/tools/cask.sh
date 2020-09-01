#!/usr/bin/env zsh

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

guiTools=(
    android-file-transfer
    android-platform-tools
    angry-ip-scanner
    appcleaner
    balenaetcher
    brooklyn
    font-fira-code
    google-chrome
    keepingyouawake
    mkvtoolnix
    omnidisksweeper
    openoffice
    plex-media-server
    postman
    pritunl
    proxyman
    responsively
    sopcast
    spotify
    tableplus
    teamviewer
    telegram-desktop
    the-unarchiver
    toinane-colorpicker
    transmission
    vlc
    yandex
    yandex-disk
)

brew cask install "${guiTools[@]}"
