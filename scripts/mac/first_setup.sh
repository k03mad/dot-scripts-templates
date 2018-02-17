# brew should be preinstalled https://brew.sh/index_ru.html
# nvm and node should be preinstalled https://github.com/creationix/nvm

function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

#
# brew
#

___print "brew: install bash"
brew install bash && \
echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells && \
chsh -s $(brew --prefix)/bin/bash

brew install bash-completion2
echo set completion-ignore-case on | sudo tee -a /etc/inputrc

brew install bash-git-prompt
brew install bash-snippets

___print "brew: install others"
brew install aria2
brew install curl
brew install git
brew install httpie
brew install m-cli
brew install mc
brew install nano
brew install thefuck
brew install tree
brew install --with-qt mkvtoolnix

#
# npm
#
___print "npm: install packages"
npm i gtop -g
npm i speed-test -g
npm i ttab -g
npm i osx-wifi-cli -g

#
# system
#

___print "system: close any open system preferences panes"
osascript -e 'tell application "System Preferences" to quit'

___print "system: set ntp server"
m ntp enable
m ntp set pool.ntp.org

___print "system: disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

___print "system: download all updates daily"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool true

___print "system: automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#
# trash
#

___print "trash: disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none"

___print "trash: avoid creating .DS_Store files on network or usb"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

___print "trash: disable the warning before emptying the trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

#
# finder
#

___print "finder: expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

___print "finder: disable the 'are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

___print "finder: show hidden files and filenames"
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

___print "finder: keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

___print "finder: disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

___print "finder: enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

___print "finder: use list view in all windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

___print "finder: show the ~/Library and /Volumes folder"
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

___print "finder: prevent photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#
# type
#

___print "type: disable character accent after key long press"
defaults write -g ApplePressAndHoldEnabled -bool false

___print "type: disable smart quotes and dashes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

___print "type: enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#
# trackpad
#

___print "trackpad: enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

___print "trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

#
# safari
#

___print "safari: don't send search queries to apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

___print "safari: show the full url in the address bar"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

___print "safari: set home page to about:blank"
defaults write com.apple.Safari HomePage -string "about:blank"

___print "safari: enable debug and develop menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

#
# transmission
#

___print "transmission: trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
___print "transmission: hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false
___print "transmission: hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

#
# desktop
#

___print "desktop: screen saver at top right screen corner"
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0

___print "desktop: disable notification center and remove the menu bar icon"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

#
# dock
#

___print "dock: left side without autohide"
m dock position LEFT
m dock autohide NO

#
# restart apps
#

___print "done: kill affected applications"
for app in "Dock" "Finder" "Photos" "Safari" "SystemUIServer" "Transmission"; do
	killall "${app}" &> /dev/null
done
