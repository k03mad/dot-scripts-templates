#!/bin/bash

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap homebrew/cask-versions

guiTools=(
    appcleaner
    etcher
    exifrenamer
    firefox-beta
    font-fira-code
    google-chrome
    hyper
    insomniax
    mkvtoolnix-app
    omnidisksweeper
    oversight
    sopcast
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
