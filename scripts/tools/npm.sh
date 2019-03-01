#!/bin/bash

npmTools=(
    forever
    gtop
    http-server
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
