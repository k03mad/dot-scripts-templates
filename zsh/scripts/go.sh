#!/usr/bin/env zsh

tools=(
    "Gelio/go-global-update"
    "owenthereal/ccat"
    "edoardottt/cariddi/cmd/cariddi"
)

for i in "${tools[@]}"
do
    githubPkg="github.com/$i@latest"

    printf "✨ %s\n" "$githubPkg"
    go install "$githubPkg"
done
