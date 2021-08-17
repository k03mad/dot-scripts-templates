#!/usr/bin/env zsh

rustup update

tools=(
    bat
    cargo-update
    exa
    lsd
    zoxide
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
