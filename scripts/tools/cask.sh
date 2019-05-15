#!/bin/bash

brew tap caskroom/cask
brew tap caskroom/fonts

guiTools=(
    android-file-transfer
    angry-ip-scanner
    appcleaner
    balenaetcher
    firefox
    font-fira-code
    google-chrome
    insomniax
    integrity
    mkvtoolnix
    mucommander
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
    whatsapp
    yandex-disk
)

for i in "${guiTools[@]}"
do
    brew cask install "$i"
done
