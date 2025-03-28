#!/usr/bin/env zsh

theme="romkatv/powerlevel10k"

plugins=(
    "Aloxaf/fzf-tab"
    "clarketm/zsh-completions"
    "lukechilds/zsh-better-npm-completion"
    "lukechilds/zsh-nvm"
    "mafredri/zsh-async:async"
    "MichaelAquilina/zsh-you-should-use:you-should-use"
    "TamCore/autoupdate-oh-my-zsh-plugins:autoupdate"
    "zdharma-continuum/fast-syntax-highlighting"
    "zpm-zsh/colors"
    "zsh-users/zsh-autosuggestions"
)

rm -rfv "${ZSH_CUSTOM_PLUGINS}"
mkdir "${ZSH_CUSTOM_PLUGINS}"

cd "${ZSH_CUSTOM_PLUGINS}" || exit

for i in "${plugins[@]}"
do
    githubUrl="https://github.com/$(echo "$i" | cut -d ":" -f 1).git"
    clonePath="$(echo "$i" | cut -d ":" -f 2)"

    if [[ "${clonePath}" =~ "/" ]]; then
        git clone --depth=1 "$githubUrl"
    else
        git clone --depth=1 "$githubUrl" "$clonePath"
    fi
done

rm -rfv "${ZSH_CUSTOM_THEMES}"
mkdir "${ZSH_CUSTOM_THEMES}"

cd "${ZSH_CUSTOM_THEMES}" || exit

git clone --depth=1 "https://github.com/$theme.git"

cd "${ZSH}" || exit
git reset --hard
