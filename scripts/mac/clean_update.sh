function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

___print "UPDATE"
___print "system"

mas upgrade

___print "brew"

brew update
brew upgrade
brew cask upgrade
brew prune
brew cleanup
brew cask cleanup
brew doctor

___print "npm"

installGlobal=(
    flamebearer
    forever
    git-authors-cli
    gtop
    http-server
    loadtest
    metrx
    nls
    npm-check-updates
    osx-wifi-cli
    puppeteer-assets
    rename-cli
    selenium-standalone
    speed-test
    ts-node
    ttab
    typescript
)

for i in "${installGlobal[@]}"
do
    if [ -z "$(npm list -g --depth=0 | grep $i)" ]; then
        echo -e "Installing $i..."
        npm i $i -g
    else
        echo -e "$i already installed"
    fi
done

npm ls --depth=0 -g
ncu -g

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
do
    echo $package
    npm i "$package" -g
done

___print "CLEANUP"

___print ".DS_Store"
sudo find ~ -type f -name '*.DS_Store' -print -delete

___print "Icon?"
sudo find ~ -type f -name 'Icon?' -print -delete

___print "eject"
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'

___print "trash"
sudo rm -rfv /Volumes/*/.Trashes
sudo rm -rfv ~/.Trash

___print "logs"
sudo rm -rfv /private/var/log/asl/*.asl
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
