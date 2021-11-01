# shellcheck disable=2164

run() {
    cd ~/git/"$1"/
    gpl
    npm run setup
    npm run "${2:-start}"
}

run "magnet-co-parser" "server"

run "cloud-tools-cron"
run "cloud-tools-bot"

pm2 flush
pm2 save
zshup

cd ~