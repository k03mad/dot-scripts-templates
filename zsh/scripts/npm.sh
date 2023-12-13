#!/usr/bin/env zsh

tools=(
    "@k03mad/dns-leak"
    "check-imports"
    "fx"
    "http-server"
    "npkill"
    "npm-check"
    "npm-check-updates"
    "tldr"
)

printf "✨ %s\n" "${tools[@]}"
npm i "${tools[@]}" -g
