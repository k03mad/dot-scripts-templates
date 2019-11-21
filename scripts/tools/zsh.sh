#!/usr/bin/env bash

git clone https://github.com/lukechilds/zsh-better-npm-completion "${ZSH_PLUGINS}/zsh-better-npm-completion"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_PLUGINS}/zsh-nvm"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_PLUGINS}/autoupdate"
git clone https://github.com/zdharma/fast-syntax-highlighting "${ZSH_PLUGINS}/fast-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_PLUGINS}/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "${ZSH_PLUGINS}/zsh-completions"

git clone --depth=1 https://github.com/romkatv/powerlevel10k "${ZSH_CUSTOM}/themes/powerlevel10k"

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
