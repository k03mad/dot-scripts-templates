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
    start-ios-simulator
)

npm i -g "${npmTools[@]}"
