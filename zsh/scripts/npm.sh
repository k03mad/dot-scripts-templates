#!/usr/bin/env zsh

tools=(
    "@k03mad/actual-versions"
    "@k03mad/dice"
    "@k03mad/dns-leak"
    "@k03mad/ip2geo"
    "@k03mad/nodejs-versions"
    "check-imports"
    "knip"
    "npm-check-updates"
    "npm-check"
)

npm i "${tools[@]}" -g

echo ""
npm ls -g --depth=0
