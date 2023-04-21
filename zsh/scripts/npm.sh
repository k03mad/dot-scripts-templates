#!/usr/bin/env zsh

tools=(
    "check-imports"
    # "fx"
    # "http-server"
    # "jay-repl"
    "npkill"
    "npm-check"
    "npm-check-updates"
    # "pm2"
    "tldr"
    "zx"
)

printf "✨ %s\n" "${tools[@]}"
npm i "${tools[@]}" -g
