#!/usr/bin/env bash

npmTools=(
    check-imports
    fx
    http-server
    jay-repl
    npm
    npm-check-updates
    pm2
    pure-prompt
    speed-test
)

npm i -g "${npmTools[@]}"
