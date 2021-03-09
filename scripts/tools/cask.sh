#!/usr/bin/env zsh

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

guiTools=(
    android-file-transfer
    android-platform-tools
    appcleaner
    balenaetcher
    caramba-switcher
    eul
    font-fira-code-nerd-font
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
    vlc
    yandex
    yandex-disk
    zoom
)

brew install "${guiTools[@]}"
