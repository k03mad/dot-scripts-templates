#!/usr/bin/env zsh

tools=(
    npm

    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
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
    printf "✨ %s\n" "$i"
    # npm i -g "$i"
done

npm i -g "${tools[@]}"
