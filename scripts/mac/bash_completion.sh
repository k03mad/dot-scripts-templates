# install bash-completions
brew uninstall bash-completion
brew tap homebrew/versions
brew install bash-completion2

# ignore case at bash completion
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
