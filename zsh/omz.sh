# shellcheck source=/dev/null

export UPDATE_ZSH_DAYS=30
export DISABLE_UPDATE_PROMPT="false"

export ZSH_THEME="powerlevel10k/powerlevel10k"

export plugins=(
    autoupdate
    colors
    command-not-found
    fast-syntax-highlighting
    you-should-use
    zsh-autosuggestions
    zsh-better-npm-completion
    zsh-completions
    zsh-nvm
)

source "${ZSH}/oh-my-zsh.sh"
