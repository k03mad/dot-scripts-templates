#!/bin/bash

function run {
    echo -e "\033[0;33m🤖  RUNNING $1 \033[0m"
    cd /home/pi/git/$1/
    git pull
    npm run setup
    npm run bot
}

run "yet-another-tlgrm-bot"
run "raspi-tlgrm-bot"
# run "grammar-tlgrm-bot"

# reboot pi after 12h
sudo shutdown -r +10080
