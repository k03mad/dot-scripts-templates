#!/bin/bash

function run {
    echo -e "\033[0;33m🤖  RUNNING $1 \033[0m"
    cd /home/pi/git/$1/
    git pull
    nvm install
    npm run setup
    npm run bot
}

if [ -z "$(forever)" ]; then
    npm i -g forever
fi

run "yet-another-tlgrm-bot"
run "raspi-tlgrm-bot"
# # run "grammar-tlgrm-bot"

# reboot pi after 12h
sudo shutdown --no-wall -r +720
