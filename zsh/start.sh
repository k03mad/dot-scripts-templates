if [ -d "${GIT_FOLDER}/lan951x-led-ctl/lan951x-led-ctl" ]; then
    sudo sh -c 'echo 0 > /sys/class/leds/PWR/brightness'
    sudo sh -c 'echo 0 > /sys/class/leds/ACT/brightness'
    sudo "${GIT_FOLDER}/lan951x-led-ctl/lan951x-led-ctl" --fdx=0 --lnk=0 --spd=0 > /dev/null
fi
