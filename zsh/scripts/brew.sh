#!/usr/bin/env zsh

taps=(
    "homebrew/command-not-found"
)

tools=(
    "aria2"
    "bettercap"
    "ccat"
    "curl"
    "findutils"
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
)

casks=(
    "android-commandlinetools"
    "android-platform-tools"
    "balenaetcher"
    "exifrenamer"
    "font-fira-code-nerd-font"
    "keepingyouawake"
    "netiquette"
    "omnidisksweeper"
    "pearcleaner"
    "steam"
    "taskexplorer"
    "transmission"
)

for i in "${taps[@]}"
do
    brew tap "$i"
done

brew install "${tools[@]}"
brew install --cask "${casks[@]}"
