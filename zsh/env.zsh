# shellcheck source=/dev/null disable=SC2012,SC2155

setopt histignorealldups

export GIT_FOLDER="${HOME}/git"

export DOT_FOLDER="${GIT_FOLDER}/dot-scripts-templates"
export DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"
export DOT_FOLDER_ZSH_SCRIPTS="${DOT_FOLDER}/zsh/scripts"
export DOT_FOLDER_CONFIGS="${DOT_FOLDER}/configs"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

export GIT_CONFIG_GLOBAL="${DOT_FOLDER_CONFIGS}/.gitconfig"
export MICRO_CONFIG_HOME="${DOT_FOLDER_CONFIGS}/micro"

export ARC_EDITOR="micro"

export FZF_DEFAULT_OPTS="--preview-window 70% --info=hidden --prompt="

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

if [ -n "${TERMUX_VERSION}" ]; then
    export SKIP_NVMRC="true"
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
/data/data/com.termux/files/usr/bin:\
/opt/homebrew/bin:\
/opt/homebrew/opt/curl/bin:\
/opt/homebrew/sbin:\
/sbin:\
/usr/local/bin:\
/usr/local/go/bin:\
/usr/local/sbin:\
/usr/sbin:\
${HOME}/arcadia\
"

export FPATH="\
${FPATH}:\
${ZSH_CUSTOM_PLUGINS}/zsh-completions/src\
"
