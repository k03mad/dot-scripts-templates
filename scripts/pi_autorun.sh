#!/bin/bash

function run {
    echo -e "\033[0;33m🤖  RUNNING $1 \033[0m"
    cd /home/pi/git/$1/
    git pull
    npm run setup
    npm run $2
}

run "raspi-tlgrm-bot" "bot"
# run "yet-another-tlgrm-bot"
# run "grammar-tlgrm-bot"

# reboot pi every N hours
sudo shutdown --no-wall -r +720
