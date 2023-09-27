#!/usr/bin/env zsh

tools=(
    "cf-speedtest"
    # "yt-dlp"
)

printf "✨ %s\n" "${tools[@]}"
python3 -m pip install -U "${tools[@]}"
