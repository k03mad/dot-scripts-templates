#!/usr/bin/env zsh

git clone https://github.com/lukechilds/zsh-better-npm-completion "${ZSH_CUSTOM}/plugins/zsh-better-npm-completion"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM}/plugins/zsh-nvm"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM}/plugins/you-should-use"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM}/plugins/autoupdate"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM}/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

git clone --depth=1 https://github.com/romkatv/powerlevel10k "${ZSH_CUSTOM}/themes/powerlevel10k"

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
