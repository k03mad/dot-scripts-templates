#!/usr/bin/env zsh

npmTools=(
    @danakt/pshe
    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-next
    @k03mad/cli-tools-node
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
