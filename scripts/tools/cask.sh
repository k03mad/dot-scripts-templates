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
    responsively
    sopcast
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
