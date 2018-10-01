#!/bin/bash

npmTools=(
    flamebearer
    forever
    git-authors-cli
    gtop
    http-server
    loadtest
    make-space
    nls
    npm-check-updates
    rename-cli
    selenium-standalone
    speed-test
)

for i in "${npmTools[@]}"
do
    npm i "$i" -g
done

selenium-standalone install
