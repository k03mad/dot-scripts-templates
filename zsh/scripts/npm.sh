#!/usr/bin/env zsh

tools=(
    "@eslint/config-inspector"
    "@k03mad/actual-versions"
    "@k03mad/dice"
    "@k03mad/dns-leak"
    "@k03mad/ip2geo"
    "@k03mad/nodejs-versions"
    "check-imports"
    "fkill-cli"
    "fx"
    "gtop"
    "http-server"
    "knip"
    "node-modules-inspector"
    "npkill"
    "npm-check-updates"
    "npm-check"
    "speed-cloudflare-cli"
    "terminal-image-cli"
    "vtop"
)

npm i "${tools[@]}" -g
