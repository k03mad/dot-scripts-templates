setopt histignorealldups
setopt hist_reduce_blanks
setopt numeric_glob_sort
setopt glob_dots

GIT_FOLDER="${HOME}/git"

DOT_FOLDER="${GIT_FOLDER}/dot-scripts-templates"
DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"
DOT_FOLDER_CONFIGS="${DOT_FOLDER}/configs"

export GIT_CONFIG_GLOBAL="${DOT_FOLDER_CONFIGS}/.gitconfig"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

if [ -n "${TERMUX_VERSION}" ]; then
    SKIP_NVMRC="true"
    export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
    export OPENSSL_DIR="${PREFIX}"
fi

if [ -n "${MAC_WORK}" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
    export ANDROID_HOME="${HOME}/Library/Android/sdk"
    export PATH="${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools"
fi

export PATH="\
${PATH}:\
/opt/homebrew/bin:\
/opt/homebrew/opt/curl/bin:\
/opt/homebrew/sbin:\
/sbin:\
/usr/local/bin:\
/usr/local/go/bin:\
/usr/local/sbin:\
/usr/sbin:\
${HOME}/.cargo/bin:\
${HOME}/.local/bin:\
${HOME}/.local/share/pnpm/bin:\
${HOME}/.opencode/bin:\
${HOME}/arcadia:\
${HOME}/go/bin:\
${HOME}/Library/pnpm/bin:\
${PREFIX}/bin
"

FPATH="\
${FPATH}:\
${ZSH_CUSTOM_PLUGINS}/zsh-completions/src\
"

ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

export FZF_DEFAULT_OPTS="--preview-window 70% --info=hidden --prompt="

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

UPDATE_ZSH_DAYS=30
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

source "${ZSH}/oh-my-zsh.sh"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd -A --group-dirs="first" --color="always" $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && cat $realpath'
zstyle ':fzf-tab:complete:ccat:*' fzf-preview '! [[ $(file --mime-type $realpath) =~ "directory|binary" ]] && ccat --color="always" $realpath'
