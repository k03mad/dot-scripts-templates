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
export ET_NO_TELEMETRY=1

export NVM_LAZY_LOAD="true"
export M2_HOME="/usr/local/bin/maven"

export PATH="\
/data/data/com.termux/files/usr/bin:\
/data/data/com.termux/files/usr/bin/applets:\
/opt/homebrew/bin:\
/opt/homebrew/sbin:\
/opt/homebrew/opt/curl/bin:\
/sbin:\
/usr/local/bin:\
/usr/local/go/bin:\
/usr/local/opt/curl/bin:\
/usr/local/opt/findutils/libexec/gnubin:\
/usr/local/opt/maven@3.5/bin:\
/usr/local/sbin:\
/usr/sbin:\
${HOME}/.cargo/bin:\
${HOME}/.local/bin:\
${HOME}/arcadia:\
${HOME}/bin:\
${HOME}/go/bin:\
${HOME}/.gvm/go/bin:\
${M2_HOME}/bin:\
${PATH}\
"

export FPATH="\
${HOME}/.zfunc:\
${ZSH_CUSTOM_PLUGINS}/zsh-completions/src:\
${FPATH}\
"

if [ -n "${TERMUX_VERSION}" ]; then
    export SKIP_NVMRC="true"
    export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
    export OPENSSL_DIR="${PREFIX}"
fi

if [ -f "${HOME}/InternalRootCA.crt" ]; then
    export NODE_EXTRA_CA_CERTS="${HOME}/InternalRootCA.crt"
fi

if [ -d "/opt/homebrew/share/android-commandlinetools/build-tools" ]; then
    export ANDROID_HOME_BUILD_TOOLS_VERSION=$(ls "/opt/homebrew/share/android-commandlinetools/build-tools" | sort -r | head -n 1)
    export ANDROID_HOME_BUILD_TOOLS="/opt/homebrew/share/android-commandlinetools/build-tools/${ANDROID_HOME_BUILD_TOOLS_VERSION}"
    export PATH="${ANDROID_HOME_BUILD_TOOLS}:${PATH}"
fi
