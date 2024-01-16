#!/usr/bin/env zsh

tools=(
    "@k03mad/dns-leak"
    "@k03mad/ip2geo"
    "check-imports"
    "fkill-cli"
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
