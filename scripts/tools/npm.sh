#!/usr/bin/env bash

npmTools=(
    check-imports
    fkill-cli
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
