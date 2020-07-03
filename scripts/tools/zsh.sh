#! /usr/bin/env zsh

git clone https://github.com/lukechilds/zsh-better-npm-completion "${ZSH_CUSTOM}/plugins/zsh-better-npm-completion"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM}/plugins/zsh-nvm"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM}/plugins/autoupdate"
git clone https://github.com/zdharma/fast-syntax-highlighting "${ZSH_CUSTOM}/plugins/fast-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM}/plugins/zsh-completions"

git clone --depth=1 https://github.com/romkatv/powerlevel10k "${ZSH_CUSTOM}/themes/powerlevel10k"

ln -s "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport" "/usr/local/bin/airport"
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
