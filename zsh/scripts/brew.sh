#!/usr/bin/env zsh

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/command-not-found
brew tap jandedobbeleer/oh-my-posh

tools=(
    android-platform-tools
    aria2
    # bettercap
    ccat
    curl
    findutils
    font-fira-code-nerd-font
    fzf
    git
    gping
    htop
    httpie
    hub
    id3v2
    jq
    maven@3.5
    m-cli
    mc
    micro
    mkvdts2ac3
    mosh
    nano
    ncdu
    neofetch
    oh-my-posh
    # nmap
    shellcheck
    tig
    the_silver_searcher
    topgrade
    tree
    wget
    youtube-dl
    zsh
    MisterTea/et/et
    ycd/tap/dstp
)

for i in "${tools[@]}"
do
    printf "✨ %s\n" "$i"
    brew install "$i"
done
