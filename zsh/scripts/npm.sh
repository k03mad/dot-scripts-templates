#!/usr/bin/env zsh

tools=(
    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-next
    @k03mad/cli-tools-node
    check-imports
    fx
    jay-repl
    npkill
    npm
    npm-check
    npm-check-updates
    pm2
    speed-cloudflare-cli
    speed-test
    tldr
)

npm i -g "${tools[@]}"
