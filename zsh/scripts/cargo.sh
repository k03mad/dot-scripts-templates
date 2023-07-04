#!/usr/bin/env zsh

tools=(
    # "bandwhich"
    # "bottom"
    # "broot"
    "cargo-update"
    # "fd-find"
    # "hurl"
    "lsd"
    # "procs"
    # "prometheus_wireguard_exporter"
    # "viu"
    "zoxide"
)

printf "✨ %s\n" "${tools[@]}"
cargo install "${tools[@]}"
