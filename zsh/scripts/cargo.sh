#!/usr/bin/env zsh

tools=(
    cargo-update
    lsd
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
