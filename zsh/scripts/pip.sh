#!/usr/bin/env zsh

tools=(
    "cf-speedtest"
    # "youtube-dl"
)

printf "✨ %s\n" "${tools[@]}"
pip install -U "${tools[@]}"
