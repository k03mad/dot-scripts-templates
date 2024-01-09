#!/usr/bin/env zsh

tools=(
    "@k03mad/dns-leak"
    "check-imports"
    "fx"
    "http-server"
    "knip"
    "npkill"
    "npm-check"
    "npm-check-updates"
    "tldr"
)

printf "✨ npm instal: %s\n" "${tools[@]}"
npm i "${tools[@]}" -g
