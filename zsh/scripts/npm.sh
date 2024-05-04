#!/usr/bin/env zsh

npmTools=(
    "pnpm"
)

pnpmTools=(
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
    "terminal-image-cli"
)

printf "\n"
printf "✨ npm install: %s\n" "${npmTools[@]}"

npm i "${npmTools[@]}" -g

printf "\n"
printf "✨ pnpm install: %s\n" "${pnpmTools[@]}"
printf "\n"

pnpm i "${pnpmTools[@]}" -g
