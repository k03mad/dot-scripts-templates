#!/bin/bash

npmTools=(
    flamebearer
    forever
    git-authors-cli
    gtop
    http-server
    loadtest
    make-space
    metrx
    nls
    npm-check-updates
    osx-wifi-cli
    puppeteer-assets
    rename-cli
    selenium-standalone
    speed-test
    ts-node
    ttab
    typescript
)

for i in "${npmTools[@]}"
do
    npm i "$i" -g
done
