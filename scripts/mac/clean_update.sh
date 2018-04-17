function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

function npmInstall {
    if [ -z "$(npm list -g --depth=0 | grep $1)" ]; then
        echo -e "Installing $1..."
        npm i $1 -g
    else
        echo -e "$1 already installed"
    fi
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

npm ls --depth=0 -g
ncu -g
for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
do
    echo $package
    npm i "$package" -g
done

npmInstall "gtop"
npmInstall "http-server"
npmInstall "loadtest"
npmInstall "npm-check-updates"
npmInstall "osx-wifi-cli"
npmInstall "puppeteer-assets"
npmInstall "rename-cli"
npmInstall "speed-test"
npmInstall "ttab"

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
