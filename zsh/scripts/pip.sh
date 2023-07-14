#!/usr/bin/env zsh

tools=(
    "cf-speedtest"
    # "yt-dlp"
)

printf "✨ %s\n" "${tools[@]}"
pip install -U "${tools[@]}"
