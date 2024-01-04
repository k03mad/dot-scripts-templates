#!/usr/bin/env zsh

npmTools=(
    "pnpm"
)

pnpmTools=(
    "@k03mad/dns-leak"
    "check-imports"
    "fx"
    "http-server"
    "npkill"
    "npm-check"
    "npm-check-updates"
    "tldr"
)

printf "✨ npm: %s\n" "${npmTools[@]}"
npm i "${npmTools[@]}" -g

printf "✨ pnpm: %s\n" "${pnpmTools[@]}"
pnpm i "${pnpmTools[@]}" -g
