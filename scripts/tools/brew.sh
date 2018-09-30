#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew tap caskroom/fonts

termTools=(
    aria2
    ccat
    curl
    git
    hr
    httpie
    id3v2
    jq
    m-cli
    mas
    mc
    micro
    mkvdts2ac3
    nano
    shellcheck
    thefuck
    tldr
    tree
    wget
    zsh
    zsh-completions
    '--with-qt mkvtoolnix'
)

guiTools=(
    appcleaner
    etcher
    exifrenamer
    font-fira-code
    google-chrome
    hyper
    insomniax
    omnidisksweeper
    oversight
    sopcast
    telegram-desktop
    the-unarchiver
    transmission
    vlc
    yandex
    yandex-disk
)

for i in "${termTools[@]}"
do
    brew install "$i"
done

for i in "${guiTools[@]}"
do
    brew cask install "$i"
done
