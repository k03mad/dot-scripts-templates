#!/usr/bin/env zsh

function ___print {
    echo -e "\\033[0;33m🤖  $1 \\033[0m"
}

___print "quit prefs"
osascript -e 'tell application "System Preferences" to quit'

___print "ntp"
m ntp enable
m ntp set ru.pool.ntp.org

___print "dock"
m dock position LEFT
m dock autohide NO

___print "disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

___print "download all updates daily"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool true

___print "automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

___print "disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none"

___print "avoid creating .DS_Store files on network or usb"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

___print "disable the warning before emptying the trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

___print "expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

___print "disable the 'are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

___print "show hidden files and filenames"
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

___print "keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

___print "disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

___print "enable snap-to-grid for icons"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

___print "use list view in all windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

___print "show the ~/Library and /Volumes folder"
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

___print "prevent photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

___print "disable character accent after key long press"
defaults write -g ApplePressAndHoldEnabled -bool false

___print "disable smart quotes and dashes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

___print "enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

___print "enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

___print "done: kill affected applications"
for app in "Dock" "Finder" "Photos" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
