# shellcheck disable=SC2154

# rewrites
alias sudo="sudo "

alias del="rm -rfv"

alias chown="chown -v"
alias chmod="chmod -v"

# misc
alias aria="aria2c --continue=true --remote-time=true --check-certificate=false --split=5 --max-connection-per-server=5 --min-split-size=1M --max-tries=5 --retry-wait=5"
alias ytv="yt-dlp -v -o \"%(upload_date)s %(title)s.%(ext)s\" -f \"bv*+?ba/b\" --extractor-args \"youtube:player_client=default,ios\" -S hdr:dv,res,vcodec:av1,acodec:opus,br --sponsorblock-mark all --sponsorblock-remove \"sponsor, selfpromo\" --embed-thumbnail --embed-chapters --embed-metadata --embed-subs --sub-langs all"

alias s="sudo \$(fc -ln -1)"
alias q="exit"
alias w="which"

alias els="eza --all --long --group-directories-first --modified --icons"
alias dls="lsd -lA --group-dirs first --date relative --blocks permission,date,size,name"
alias tls="dls --tree --ignore-glob node_modules --ignore-glob .git"

alias ft="ag -fi --depth=-1"
alias ports="sudo lsof -i -P -n | grep LISTEN"

alias dsc="find . -name '.DS_Store' -type f -exec rm -rfv {} \;"
alias sdock="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}' && killall Dock"

alias dst="dd if=/dev/zero of=./testfile.mad bs=8k count=3000000 status=progress && del ./testfile.mad"

alias aadb="aapt dump badging"

# adb
alias adbenable="adb shell pm enable --user 0"
alias adbdisable="adb shell pm disable-user --user 0"
alias adbdnson="adb shell settings put global private_dns_mode hostname && adb shell settings put global private_dns_specifier"
alias adbdnsoff="adb shell settings put global private_dns_mode off"
alias adblist="\
    echo \"\${c[green]}enabled:\${c[reset]}\"\
    && echo\
    && adb shell 'pm list packages -e' | sed 's/package://' | sort\
    && echo\
    && echo \"\${c[red]}disabled:\${c[reset]}\"\
    && echo\
    && adb shell 'pm list packages -d' | sed 's/package://' | sort\
"

# pkg managers
alias aptin="\${DOT_FOLDER_ZSH_SCRIPTS}/apt.sh"
alias aptup="sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get clean"

alias pkgup="pkg update && pkg upgrade && pkg autoclean && pkg clean && apt autoremove"

alias brewin="\${DOT_FOLDER_ZSH_SCRIPTS}/brew.sh"
alias brewup="brew list && brew update && brew upgrade && brew autoremove && brew cleanup -s && brew doctor"
alias brewcl="brew remove \$(brew list --formula)"

alias cargoin="\${DOT_FOLDER_ZSH_SCRIPTS}/cargo.sh"
alias cargoup="rustup update && cargo install-update -a"

alias goin="\${DOT_FOLDER_ZSH_SCRIPTS}/go.sh"
alias goup="go-global-update"

alias pipin="\${DOT_FOLDER_ZSH_SCRIPTS}/pip.sh"
alias pipup="\${DOT_FOLDER_ZSH_SCRIPTS}/pip.sh"

alias npmin="\${DOT_FOLDER_ZSH_SCRIPTS}/npm.sh"
alias npmls="echo \"✨ npm ls\n\" && npm ls -g --depth=0 && (npm outdated -g || true) && echo \"\" && echo \"✨ pnpm ls\n\" && pnpm ls -g && echo \"\" && pnpm outdated -g"
alias npmcl="echo \"✨ pnpm rm\n\" && rm -rfv \$(pnpm root -g) && rm -rf \$(pnpm store path) && echo \"\n✨ npm rm\n\" && npm ls -g --json | jq -r '.dependencies|keys-[\"npm\",\"corepack\",\"pnpm\"]|join(\"\n\")' | xargs -t npm remove -g"

alias nvmin="nvm install \$(cat .nvmrc) && npmin"
alias nvmup="nvm install node && npmin"
alias nvmcl="rm \$(ls -td \${NVM_DIR}/versions/node/* | tail -n +2) && rm \${NVM_DIR}/.cache/bin"
alias nvmls="\
    echo \"\${c[blue]}npm current:\${c[reset]} v\$(npm -v)\"\
    && echo \"\${c[magenta]}node current:\${c[reset]} \$(node -v)\"\
    && echo \"\${c[magenta]}node remote:\${c[reset]} \$(nvm version-remote)\"\
    && echo\
    && nvm ls\
    && echo\
    && npmls
"

alias zshin="\${DOT_FOLDER_ZSH_SCRIPTS}/zsh.sh"

# docker
alias dcup="docker-compose pull && docker-compose up -d && dprune"
alias dprune="docker system prune -af"

# git/arc
alias gs="git status -s"
alias ga="git add . && gs"
alias gp="git push"
alias gpl="git pull origin master --no-edit"
alias gplo="git pull origin \$(git branch | grep '\*' | cut -d' ' -f2-) --no-edit"
alias grh="git reset --hard"
alias gbd="git branch -D \$(git branch | grep -v \* | xargs -r)"

alias aa="arc add . && as"
alias ap="arc push"
alias am="arc mount ~/arcadia"
alias as="arc status -s"
alias apl="arc pull"
alias arh="arc reset --hard"
alias abd="arc branch | grep -v trunk | xargs -L 1 arc branch -D"

# service
alias scstatus="sudo systemctl status"
alias screstart="sudo systemctl daemon-reload && sudo systemctl restart"
alias scenable="sudo systemctl enable"
alias scdisable="sudo systemctl disable"
alias scstart="sudo systemctl start"
alias scstop="sudo systemctl stop"
