# shellcheck disable=2139,2154

alias sudo="sudo "
alias s="sudo \$(fc -ln -1)"


alias q="exit"

alias del="rm -rfv"

alias els="exa --all --long --group-directories-first --modified --icons"
alias dls="lsd -lA --group-dirs first --date relative --blocks permission,date,size,name"
alias tls="dls --tree --ignore-glob node_modules --ignore-glob .git"

alias ft="ag -fi --depth=-1"
alias ports="sudo lsof -i -P -n | grep LISTEN"

alias dsc="find . -name '.DS_Store' -type f -exec rm -rfv {} \;"
alias sdock="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}' && killall Dock"

alias dst="dd if=/dev/zero of=./testfile.mad bs=8k count=30000 && del ./testfile.mad"

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

alias aptin="\${DOT_FOLDER_ZSH_SCRIPTS}/apt.sh"
alias aptup="sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get clean"

alias pkgup="pkg update && pkg upgrade && pkg autoclean && pkg clean && aptup"

alias brewin="\${DOT_FOLDER_ZSH_SCRIPTS}/brew.sh"
alias brewup="brew list && brew update && brew upgrade && brew cleanup -s && brew doctor || true"

alias cargoin="\${DOT_FOLDER_ZSH_SCRIPTS}/cargo.sh"
alias cargoup="rustup update && cargo install-update -a"

alias npmin="\${DOT_FOLDER_ZSH_SCRIPTS}/npm.sh"
alias npmls="npm ls -g --depth=0 && npm outdated -g"
alias npmcl="npm ls -g --json | jq -r '.dependencies|keys-[\"npm\"]|join(\"\n\")' | xargs -t npm remove -g"

alias nvmin="nvm install \$(cat .nvmrc) && npmin"
alias nvmup="nvm install node && npmin"
alias nvmcl="del \$(ls -td \${NVM_DIR}/versions/node/* | tail -n +2) && del \${NVM_DIR}/.cache/bin"
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

alias scstatus="sudo systemctl status"
alias screstart="sudo systemctl daemon-reload && sudo systemctl restart"
alias scenable="sudo systemctl enable"
alias scdisable="sudo systemctl disable"
alias scstart="sudo systemctl start"
alias scstop="sudo systemctl stop"
