#!/usr/bin/env bash

npmTools=(
    @k03mad/get-ip-info
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm
    npm-check-updates
    pm2
    pnpm
    speed-test
    yarn
)

npm i -g "${npmTools[@]}"
