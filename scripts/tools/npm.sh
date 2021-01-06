#!/usr/bin/env zsh

npmTools=(
    @danakt/pshe
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-node
    @k03mad/cli-tools-lan
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm-check-updates
    pm2
    speed-test
)

npm i -g "${npmTools[@]}"
