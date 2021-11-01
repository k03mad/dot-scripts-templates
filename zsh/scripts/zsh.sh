#!/usr/bin/env zsh

rm -rf "${ZSH_CUSTOM_PLUGINS}"
rm -rf "${ZSH_CUSTOM_THEMES}"

git clone https://github.com/lukechilds/zsh-better-npm-completion "${ZSH_CUSTOM_PLUGINS}/zsh-better-npm-completion"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM_PLUGINS}/zsh-nvm"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM_PLUGINS}/you-should-use"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM_PLUGINS}/autoupdate"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting "${ZSH_CUSTOM_PLUGINS}/fast-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM_PLUGINS}/zsh-completions"
git clone https://github.com/zpm-zsh/colors "${ZSH_CUSTOM_PLUGINS}/colors"

git clone --depth=1 https://github.com/romkatv/powerlevel10k "${ZSH_CUSTOM_THEMES}/powerlevel10k"
