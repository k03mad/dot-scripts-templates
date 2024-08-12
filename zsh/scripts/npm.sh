#!/usr/bin/env zsh

npmTools=(
    "pnpm"
)

pnpmTools=(
    "@k03mad/actual-versions"
    "@k03mad/dice"
    "@k03mad/dns-leak"
    "@k03mad/ip2geo"
    "@k03mad/nodejs-versions"
    "check-imports"
    "fkill-cli"
    "fx"
    "gtop"
    "http-server"
    "knip"
    "npkill"
    "npm-check-updates"
    "npm-check"
    "speed-cloudflare-cli"
    "terminal-image-cli"
    "vtop"
)

printf "\n"
printf "✨ npm install: %s\n" "${npmTools[@]}"

npm i "${npmTools[@]}" -g

printf "\n"
printf "✨ pnpm install: %s\n" "${pnpmTools[@]}"
printf "\n"

pnpm i "${pnpmTools[@]}" -g
