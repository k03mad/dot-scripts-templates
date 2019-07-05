#!/bin/bash

mas upgrade

brew update
brew upgrade
brew cask upgrade
brew cleanup
brew doctor

npm i npm -g
npm ls --depth=0 -g
npm outdated -g

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
do
    echo "$package"
    npm i "$package" -g
done
