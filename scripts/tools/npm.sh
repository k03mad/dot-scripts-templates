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
    pure-prompt
    speed-test
)

npm i -g "${npmTools[@]}"
