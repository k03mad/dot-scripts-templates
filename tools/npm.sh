#!/usr/bin/env zsh

npmTools=(
    @k03mad/cli-tools-lan
    @k03mad/cli-tools-mikrotik
    @k03mad/cli-tools-next
    @k03mad/cli-tools-node
    check-imports
    fx
    http-server
    jay-repl
    npkill
    npm-check
    npm-check-updates
    pjs-tool
    pm2
    speed-cloudflare-cli
)

for i in "${npmTools[@]}"
do
    printf "\n ✨ %s \n" "$i"
    if npm list -g "$i" > /dev/null 2>&1; then
        printf " ✅ already installed \n"
    else
        npm i -g "$i"
    fi
done
