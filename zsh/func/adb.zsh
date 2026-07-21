alias adbenable="adb shell pm enable --user 0"
alias adbdisable="adb shell pm disable-user --user 0"
alias adbdnson="\
    adb shell settings put global private_dns_mode hostname \
    && adb shell settings put global private_dns_specifier \
"
alias adbdnsoff="adb shell settings put global private_dns_mode off"
alias adblist="\
    echo enabled: \
    && echo \
    && adb shell 'pm list packages -e' | sed 's/package://' | sort \
    && echo \
    && echo disabled: \
    && echo \
    && adb shell 'pm list packages -d' | sed 's/package://' | sort \
"
