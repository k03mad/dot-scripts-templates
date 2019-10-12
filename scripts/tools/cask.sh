#!/usr/bin/env bash

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/command-not-found

guiTools=(
    android-file-transfer
    angry-ip-scanner
    appcleaner
    balenaetcher
    font-fira-code
    google-chrome
    insomniax
    mkvtoolnix
    omnidisksweeper
    openoffice
    sopcast
    plex-media-server
    postman
    pritunl
    tableplus
    teamviewer
    telegram-desktop
    the-unarchiver
    transmission
    vlc
    yandex
    yandex-disk
)

brew cask install "${guiTools[@]}"
