#!/usr/bin/env zsh

tools=(
    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-next
    @k03mad/cli-tools-node
    check-imports
    fx
    http-server
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
