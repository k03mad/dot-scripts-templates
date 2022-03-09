#!/usr/bin/env zsh

tools=(
    npm

    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-next
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm-check
    npm-check-updates
    pm2
    speed-cloudflare-cli
    speed-test
    tldr
)

for i in "${tools[@]}"
do
    printf "\n ✨ %s \n\n" "$i"
    npm i -g "$i"
done
