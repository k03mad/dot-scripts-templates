#!/usr/bin/env bash

npmTools=(
    @danakt/pshe
    @k03mad/get-ip-info
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm
    npm-check-updates
    pm2
    speed-test
    yarn
)

npm i -g "${npmTools[@]}"
