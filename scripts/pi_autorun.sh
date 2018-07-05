#!/bin/bash

function run {
    echo -e "\\033[0;33m🤖  RUNNING $1/$2 \\033[0m"
    cd /home/pi/git/"$1"/ || exit
    git pull
    npm run setup
    npm run "$2"
}

# reboot pi every N minutes
sudo shutdown --no-wall -r +720

run "raspberry-tools" "bot"
run "adblock-hosts-list" "deploy"
