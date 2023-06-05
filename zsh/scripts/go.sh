#!/usr/bin/env zsh

tools=(
    "github.com/Gelio/go-global-update@latest"
    "github.com/owenthereal/ccat@latest"
)

printf "✨ %s\n" "${tools[@]}"
go install "${tools[@]}"
