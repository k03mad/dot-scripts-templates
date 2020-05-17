#!/usr/bin/env bash

npmTools=(
    @danakt/pshe
    @k03mad/get-ip-info
    @k03mad/mikrotik-pptp-hidemy-ip
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm
    npm-check-updates
    pm2
    speed-test
    why-npm-i-so-long
)

npm i -g "${npmTools[@]}"
