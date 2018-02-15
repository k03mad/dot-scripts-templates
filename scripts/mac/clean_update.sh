# brew should be preinstalled https://brew.sh/index_ru.html

function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

___print "update:"

___print "brew"
brew update
brew upgrade
brew tap caskroom/cask
brew prune
brew cleanup
brew cask cleanup
brew doctor

___print "npm"
npm i npm -g
npm i npm-check-updates -g

npm ls --depth=0 -g
ncu -g
for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
do
    echo $package
    npm i "$package" -g
done

___print "cleanup:"

___print ".DS_Store"
find . -type f -name '*.DS_Store' -print -delete

___print "Icon?"
find . -type f -name 'Icon?' -print -delete

___print "eject"
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'

___print "trash"
sudo rm -rfv /Volumes/*/.Trashes
sudo rm -rfv ~/.Trash

___print "logs"
sudo rm -rfv /private/var/log/asl/*.asl
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'