#!/usr/bin/env zsh

taps=(
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/command-not-found"
)

tools=(
    # "android-platform-tools"
    # "aria2"
    # "balenaetcher"
    # "bettercap"
    # "ccat"
    "curl"
    # "dog"
    # "findutils"
    # "exifrenamer"
    # "font-fira-code-nerd-font"
    "fzf"
    "git"
    # "gping"
    # "htop"
    # "httpie"
    # "hub"
    # "id3v2"
    # "jq"
    # "maven@3.5"
    # "m-cli"
    # "mc"
    # "micro"
    # "mkvdts2ac3"
    # "mosh"
    # "nano"
    # "ncdu"
    # "neofetch"
    # "nmap"
    "shellcheck"
    # "tig"
    # "the_silver_searcher"
    # "topgrade"
    # "tree"
    # "wget"
    # "whois"
    # "yt-dlp"
    "zsh"
    "MisterTea/et/et"
    # "ycd/tap/dstp"
)

for i in "${taps[@]}"
do
    printf "✨ %s\n" "$i"
    brew tap "$i"
done

printf "✨ %s\n" "${tools[@]}"
brew install "${tools[@]}"
