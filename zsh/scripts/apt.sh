#!/usr/bin/env zsh

tools=(
    "aria2"
    "command-not-found"
    "curl"
    "fzf"
    "git"
    "htop"
    "id3v2"
    "jq"
    "libssl-dev"
    "mc"
    "micro"
    "nano"
    "ncdu"
    "neofetch"
    "nmap"
    "pkg-config"
    "shellcheck"
    "tig"
    "tree"
    "unzip"
    "wget"
    "zsh"
)

printf "✨ %s\n" "${tools[@]}"

if [ -n "${TERMUX_VERSION}" ]; then
    apt-get -y install "${tools[@]}"
else
    sudo apt-get -y install "${tools[@]}"
fi
