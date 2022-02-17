#!/usr/bin/env zsh

tools=(
    bandwhich
    bottom
    cargo-update
    fd-find
    lsd
    procs
    viu
    zoxide
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
