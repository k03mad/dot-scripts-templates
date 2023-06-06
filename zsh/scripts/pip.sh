#!/usr/bin/env zsh

tools=(
    "cf-speedtest"
)

printf "✨ %s\n" "${tools[@]}"
pip install -U "${tools[@]}" -g
