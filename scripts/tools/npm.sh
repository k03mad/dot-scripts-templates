#!/bin/bash

npmTools=(
    npm
    fx
    http-server
    jay-repl
    npm-check-updates
    pm2
    pure-prompt
    speed-test
    start-ios-simulator
)

npm i -g "${npmTools[@]}"
