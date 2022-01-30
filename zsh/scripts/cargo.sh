#!/usr/bin/env zsh

tools=(
    bandwhich
    bat
    cargo-update
    exa
    fd-find
    lsd
    price
    viu
    zoxide
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
