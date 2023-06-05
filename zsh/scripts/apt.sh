#!/usr/bin/env zsh

tools=(
    "aria2"
    "curl"
    "fzf"
    "git"
    # "htop"
    # "hub"
    # "id3v2"
    "jq"
    # "libssl-dev"
    # "mc"
    # "micro"
    # "mosh"
    "nano"
    "ncdu"
    # "neofetch"
    # "nmap"
    # "pkg-config"
    "shellcheck"
    # "tig"
    # "tree"
    # "unzip"
    "wget"
    # "youtube-dl"
    "zsh"
)

printf "✨ %s\n" "${tools[@]}"

if [ -n "${TERMUX_VERSION}" ]; then
    apt-get -y install "${tools[@]}"
else
    sudo apt-get -y install "${tools[@]}"
fi
