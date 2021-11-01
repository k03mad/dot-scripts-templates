# shellcheck disable=2154

alias hr="tput cols | pjs \"''.padEnd(_, '—')\""
alias bat="hr && bat"
alias del="rm -rfv"
alias els="exa -alF --group-directories-first --git"
alias dls="lsd -lA --group-dirs first --date relative --blocks permission,date,size,name"
alias ff="tree -i -f | grep"
alias ft="ag -uf --depth=-1"
alias tree="pwd && tree -aIC 'node_modules|.git' --dirsfirst --sort=name"
alias ports="sudo lsof -i -P -n | grep LISTEN"

alias zshin="\${DOT_FOLDER_ZSH_SCRIPTS}/zsh.sh"

alias aptin="\${DOT_FOLDER_ZSH_SCRIPTS}/apt.sh"
alias aptup="apt-get update && apt-get dist-upgrade && apt-get autoremove && apt-get clean"
alias aptups="sudo -- sh -c 'apt-get update && apt-get dist-upgrade && apt-get autoremove && apt-get clean'"

alias brewin="\${DOT_FOLDER_ZSH_SCRIPTS}/brew.sh"
alias brewup="echo \"\${c[green]}brews installed:\${c[reset]}\" && brew list --formula && echo \"\${c[yellow]}casks installed:\${c[reset]}\" && brew list --cask && brew update && brew upgrade && brew cleanup -s && brew doctor"

alias cargoin="\${DOT_FOLDER_ZSH_SCRIPTS}/cargo.sh"
alias cargoup="rustup update && cargo install-update -a"

alias npmin="\${DOT_FOLDER_ZSH_SCRIPTS}/npm.sh"
alias npmls="npm ls -g --depth=0 && npm outdated -g"
alias npmcl="npm ls -g --json | jq -r '.dependencies|keys-[\"npm\"]|join(\"\n\")' | xargs -t npm remove -g"

alias nvmup="nvm install node && npmin"
alias nvmin="nvm install \$(cat .nvmrc) && npmin"
alias nvmcl="del \$(ls -td \${NVM_DIR}/versions/node/* | tail -n +2) && del \${NVM_DIR}/.cache/bin"
alias nvmls="echo \"\${c[blue]}npm current:\${c[reset]} v\$(npm -v)\" && echo \"\${c[magenta]}node current:\${c[reset]} \$(node -v)\" && echo \"\${c[magenta]}node remote:\${c[reset]} \$(nvm version-remote)\" && echo && nvm ls"

alias st="echo 'https://speed.cloudflare.com/\n' && speed-cloudflare-cli"
alias stn="speed-test -v"
alias dst="dd if=/dev/zero of=./testfile.mad bs=8k count=30000 && del ./testfile.mad"

alias gs="git status -s"
alias ga="git add . && gs"
alias gp="git push"
alias gpl="git pull origin master --no-edit"
alias gplo="git pull origin \$(git branch | grep '\*' | cut -d' ' -f2-) --no-edit"
alias grh="git reset --hard"
alias gbd="git branch -D \$(git branch | grep -v \* | xargs -r)"

alias syncbb="git pull origin master --no-edit && git pull bb master --no-edit && git push origin master && git push bb master"

alias depup="gpl && ncu -u && npm run setup && ga && gce 'update deps' && gp"

alias dsc="find . -name '.DS_Store' -type f -exec rm -rfv {} \;"
alias sdock="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}' && killall Dock"