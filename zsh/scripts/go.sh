#!/usr/bin/env zsh

tools=(
    "github.com/Gelio/go-global-update@latest"
    "github.com/owenthereal/ccat@latest"
)

for i in "${tools[@]}"
do
    printf "✨ %s\n" "$i"
    go install "$i"
done
