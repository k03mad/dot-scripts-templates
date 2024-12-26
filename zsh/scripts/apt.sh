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
    "nala"
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

sudo apt-get -y install "${tools[@]}"
