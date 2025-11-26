# shellcheck disable=SC2154

alias sudo="sudo "
alias s="sudo \$(fc -ln -1)"

alias q="exit"
alias й=q

alias del="rm -rfv"

alias lsd="lsd -lA --group-dirs first --size short --date '+[%d.%m.%y %X]'"
alias dls="lsd --blocks date,size,name"
alias sls="lsd --blocks date,size,name --total-size --sizesort"
alias tls="lsd --blocks date,size,name --total-size --tree --ignore-glob node_modules --ignore-glob .git"

alias ports="sudo lsof -i -P -n | grep LISTEN"

alias dsc="find . -name '.DS_Store' -type f -exec rm -rfv {} \;"
alias sdock="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}' && killall Dock"

alias dst="dd if=/dev/zero of=./testfile.mad bs=8k count=3000000 status=progress && del ./testfile.mad"

# downloaders
alias aria="aria2c \
    --continue=true \
    --remote-time=true \
    --check-certificate=false \
    --split=3 \
    --max-connection-per-server=3 \
    --min-split-size=1M \
    --max-tries=12 \
    --retry-wait=5 \
"
alias ytv="yt-dlp \
    -v -o \"%(upload_date)s %(title)s.%(ext)s\" \
    -f \"bv*+?ba/b\" \
    --extractor-args \"youtube:player_client=default,ios\" \
    -S hdr:dv,res,vcodec:av1,acodec:opus,br \
    --sponsorblock-mark all \
    --sponsorblock-remove \"sponsor, selfpromo\" \
    --embed-thumbnail \
    --embed-chapters \
    --embed-metadata \
    --embed-subs \
    --sub-langs all \
"

# adb
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

# pkg managers
alias aptup="\
    sudo apt-get update \
    && sudo apt-get upgrade \
    && sudo apt-get dist-upgrade \
    && sudo apt-get clean \
    && sudo apt-get autopurge \
"

alias pkgup="\
    pkg update \
    && pkg upgrade \
    && pkg clean \
    && apt autopurge \
"

alias brewup="\
    brew list \
    && brew update \
    && brew upgrade \
    && brew autoremove \
    && brew cleanup -s \
    && brew doctor \
"
alias brewcl="brew remove \$(brew list --formula)"

alias gitup="\${DOT_FOLDER_ZSH_SCRIPTS}/git.sh"

alias npmin="\${DOT_FOLDER_ZSH_SCRIPTS}/npm.sh"
alias npmls="\
    npm ls -g --depth=0 \
    && (npm outdated -g || true)
"
alias npmcl="\
    echo \
    && echo ✨ npm rm \
    && echo \
    && (npm ls -g --json \
        | jq -r '.dependencies|keys-[\"npm\"]|join(\"\n\")' \
        | xargs -t npm remove -g || true)
"

alias nvmin="nvm install \$(cat .nvmrc) && echo && npmin"
alias nvmup="nvm install node && echo && npmin"
alias nvmcl="rm -rfv \$(ls -td \${NVM_DIR}/versions/node/* | tail -n +2) && rm -rfv \${NVM_DIR}/.cache/bin"
alias nvmls="\
    echo \
    && echo \"✨ \${c[green]}npm  \${c[blue]}current\${c[reset]} v\$(npm -v)\" \
    && echo \
    && echo ✨ \${c[green]}node \${c[blue]}current\${c[reset]} \$(node -v) \
    && echo \"✨ \${c[green]}node \${c[magenta]}remote\${c[reset]}  \$(nvm version-remote)\" \
    && echo \
    && nvm ls
"

alias zshin="\${DOT_FOLDER_ZSH_SCRIPTS}/zsh.sh"

# git/arc
alias ga="git add . && gs"
alias gbd="git branch -D \$(git branch | grep -v \* | xargs -r)"
alias gp="git push"
alias gpl="git pull origin master --no-edit"
alias gplo="git pull origin \$(git branch | grep '\*' | cut -d' ' -f2-) --no-edit"
alias grh="git reset --hard"
alias gs="git status -s"

alias aa="arc add . && as"
alias abd="arc branch | grep -v trunk | xargs -L 1 arc branch -D"
alias am="arc mount ~/arcadia"
alias ap="arc push"
alias apl="arc pull"
alias arh="arc reset --hard --force"
alias as="arc status -s"
alias act="arc checkout trunk"

# service
alias scstatus="sudo systemctl status"
alias screstart="sudo systemctl daemon-reload && sudo systemctl restart"
alias scenable="sudo systemctl enable"
alias scdisable="sudo systemctl disable"
alias scstart="sudo systemctl start"
alias scstop="sudo systemctl stop"

# apps
alias steam="open /Applications/Steam.app"
alias crossover="open /Applications/CrossOver.app"
alias greenlight="open /Applications/Greenlight.app"
