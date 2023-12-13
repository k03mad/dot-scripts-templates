#!/usr/bin/env zsh

tools=(
    "bandwhich"
    "bottom"
    "broot"
    "cargo-update"
    "eza"
    "fd-find"
    "lsd"
    "procs"
    "viu"
    "zoxide"
)

printf "✨ %s\n" "${tools[@]}"
cargo install "${tools[@]}"
