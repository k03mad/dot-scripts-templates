# shellcheck source=/dev/null

export UPDATE_ZSH_DAYS=30
export DISABLE_UPDATE_PROMPT="true"

export ZSH_THEME="powerlevel10k/powerlevel10k"

export plugins=(
    autoupdate
    colors
    command-not-found
    copyfile
    fast-syntax-highlighting
    fzf-tab
    you-should-use
    zsh-autosuggestions
    zsh-better-npm-completion
    zsh-completions
    zsh-nvm
    web-search
)

source "${ZSH}/oh-my-zsh.sh"
autoload -Uz compinit && compinit
