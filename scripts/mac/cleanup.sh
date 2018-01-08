function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

___print "remove all .DS_Store and Icon? files"
find . -type f -name '*.DS_Store' -print -delete
find . -type f -name 'Icon?' -print -delete

___print "eject all disks"
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'

___print "clear trash and logs"
sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

___print "brew cleanup"
brew cleanup
brew cask cleanup
