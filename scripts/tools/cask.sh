#!/usr/bin/env zsh

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

guiTools=(
    android-file-transfer
    android-platform-tools
    appcleaner
    balenaetcher
    eul
    font-fira-code-nerd-font
    google-chrome
    keepingyouawake
    mkvtoolnix
    omnidisksweeper
    openoffice
    pritunl
    responsively
    sopcast
    tableplus
    teamviewer
    telegram-desktop
    the-unarchiver
    toinane-colorpicker
    transmission
    vlc
    yandex
    yandex-disk
    zoomus
)

brew cask install "${guiTools[@]}"
