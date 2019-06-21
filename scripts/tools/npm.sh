#!/bin/bash

npmTools=(
    forever
    fx
    gtop
    http-server
    jay-repl
    npm-check-updates
    pure-prompt
    rename-cli
    selenium-standalone
    speed-test
    start-ios-simulator
)

for i in "${npmTools[@]}"
do
    npm i "$i" -g
done

selenium-standalone install
