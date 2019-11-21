#!/usr/bin/env bash

npmTools=(
    npm
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm-check-updates
    pm2
    speed-test
    yarn
)

npm i -g "${npmTools[@]}"
