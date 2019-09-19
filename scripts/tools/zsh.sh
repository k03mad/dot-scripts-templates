#!/bin/bash

ZSH_CUSTOM="${ZSH}/custom"

git clone https://github.com/djui/alias-tips "${ZSH_CUSTOM}/plugins/alias-tips"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM}/plugins/zsh-nvm"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM}/plugins/autoupdate"
git clone https://github.com/zdharma/fast-syntax-highlighting "${ZSH_CUSTOM}/plugins/fast-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
