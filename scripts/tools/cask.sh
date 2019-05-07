#!/bin/bash

brew tap caskroom/cask
brew tap caskroom/fonts

guiTools=(
    appcleaner
    balenaetcher
    exifrenamer
    firefox
    font-fira-code
    google-chrome
    hyper
    insomniax
    integrity
    marta
    mkvtoolnix
    omnidisksweeper
    sopcast
    pritunl
    telegram-desktop
    the-unarchiver
    transmission
    vlc
    yandex-disk
)

for i in "${guiTools[@]}"
do
    brew cask install "$i"
done
