setopt histignorealldups
setopt hist_reduce_blanks
setopt numeric_glob_sort
setopt glob_dots

typeset -U path fpath

GIT_FOLDER="${HOME}/git"
DOT_FOLDER="${GIT_FOLDER}/dot-scripts-templates"
DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export FZF_DEFAULT_OPTS="--preview-window 70% --info=hidden --prompt="
export GIT_CONFIG_GLOBAL="${DOT_FOLDER}/configs/.gitconfig"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

UPDATE_ZSH_DAYS=30
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    async
    autoupdate
    colors
    command-not-found
    fast-syntax-highlighting
    fzf-tab
    you-should-use
    zoxide
    zsh-autosuggestions
    zsh-better-npm-completion
    zsh-nvm
)

if [[ -n ${TERMUX_VERSION} ]]; then
    SKIP_NVMRC=true
    export OPENSSL_DIR="${PREFIX}"

    path+=(
        "${PREFIX}/bin"
    )

    fpath+=(
        "${PREFIX}/share/zsh/site-functions"
    )
fi

path+=(
    /opt/homebrew/bin
    /opt/homebrew/opt/curl/bin
    /opt/homebrew/sbin
    /sbin
    /usr/local/bin
    /usr/local/go/bin
    /usr/local/sbin
    /usr/sbin
    "${HOME}/.cargo/bin"
    "${HOME}/.local/bin"
    "${HOME}/.local/share/pnpm/bin"
    "${HOME}/.opencode/bin"
    "${HOME}/arcadia"
    "${HOME}/go/bin"
    "${HOME}/Library/pnpm/bin"
)

fpath+=(
    "${ZSH_CUSTOM_PLUGINS}/zsh-completions/src"
)

source "${ZSH}/oh-my-zsh.sh"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && cat $realpath'
zstyle ':fzf-tab:complete:ccat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && ccat --color="always" $realpath'
