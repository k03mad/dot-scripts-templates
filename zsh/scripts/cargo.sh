#!/usr/bin/env zsh

tools=(
    bandwhich
    bottom
    broot
    cargo-update
    fd-find
    lsd
    procs
    viu
    zoxide
)

for i in "${tools[@]}"
do
    printf "✨ %s\n" "$i"
    cargo install "$i"
done
