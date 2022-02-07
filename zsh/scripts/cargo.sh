#!/usr/bin/env zsh

tools=(
    bandwhich
    bottom
    broot
    cargo-update
    du-dust
    exa
    fd-find
    jql
    lsd
    procs
    ripgrep
    viu
    zoxide
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    cargo install "$i"
done
