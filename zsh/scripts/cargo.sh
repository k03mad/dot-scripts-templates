#!/usr/bin/env zsh

tools=(
    bat
    cargo-update
    exa
    fd-find
    lsd
    zoxide
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
