#!/usr/bin/env zsh

npmTools=(
    "@earendil-works/pi-coding-agent"
    "@k03mad/dice"
    "@k03mad/dns-leak"
    "@k03mad/ip2geo"
    "@k03mad/nodejs-versions"
    "npm-check-updates"
    "npm-check"
)

npm i "${npmTools[@]}" -g
npm ls -g --depth=0
