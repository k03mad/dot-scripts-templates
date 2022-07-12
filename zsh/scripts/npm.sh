#!/usr/bin/env zsh

tools=(
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

printf "✨ %s\n" "${tools[@]}"
npm i "${tools[@]}" --location=global
