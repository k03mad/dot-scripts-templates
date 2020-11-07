#!/usr/bin/env zsh

npmTools=(
    @danakt/pshe
    @k03mad/change-node-version
    @k03mad/get-ip-info
    @k03mad/mikrotik-tools
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm-check-updates
    pm2
    speed-test
    why-npm-i-so-long
    yarn
)

npm i -g "${npmTools[@]}"
