# shellcheck source=/dev/null disable=2016

export UPDATE_ZSH_DAYS=30
export DISABLE_UPDATE_PROMPT="false"

export ZSH_THEME="powerlevel10k/powerlevel10k"

export plugins=(
    async
    autoupdate
    colors
    command-not-found
    copyfile
    fast-syntax-highlighting
    fzf-tab
    web-search
    you-should-use
    zsh-autosuggestions
    zsh-better-npm-completion
    zsh-completions
    zsh-nvm
)

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && cat $realpath'
zstyle ':fzf-tab:complete:ccat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && ccat --color="always" $realpath'

source "${ZSH}/oh-my-zsh.sh"
autoload -Uz compinit && compinit
