#!/usr/bin/env zsh

taps=(
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/command-not-found"
)

tools=(
    "android-platform-tools"
    "aria2"
    "balenaetcher"
    "bettercap"
    "ccat"
    "curl"
    "dog"
    "exifrenamer"
    "findutils"
    "font-fira-code-nerd-font"
    "fzf"
    "gh"
    "git"
    "gnirehtet"
    "gping"
    "htop"
    "httpie"
    "id3v2"
    "jq"
    "lsd"
    "m-cli"
    "mc"
    "micro"
    "mkvdts2ac3"
    "nano"
    "ncdu"
    "neofetch"
    "nmap"
    "shellcheck"
    "tig"
    "the_silver_searcher"
    "topgrade"
    "tree"
    "wget"
    "whois"
    "yt-dlp"
    "zoxide"
    "zsh"
    "MisterTea/et/et"
    "ycd/tap/dstp"
)

for i in "${taps[@]}"
do
    printf "✨ %s\n" "$i"
    brew tap "$i"
done

printf "✨ %s\n" "${tools[@]}"
brew install "${tools[@]}"
