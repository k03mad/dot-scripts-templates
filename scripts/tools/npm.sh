#!/bin/bash

npmTools=(
    npm
    forever
    fx
    http-server
    jay-repl
    npm-check-updates
    pure-prompt
    speed-test
    start-ios-simulator
)

for i in "${npmTools[@]}"
do
    npm i "$i" -g
done
