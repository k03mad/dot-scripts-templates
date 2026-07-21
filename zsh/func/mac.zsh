alias dsc="find . -name '.DS_Store' -type f -exec rm -rfv {} \;"
alias sdock="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}' && killall Dock"

alias dst="dd if=/dev/zero of=./testfile.mad bs=8k count=3000000 status=progress && del ./testfile.mad"
