export DOT_FOLDER="${HOME}/git/dot-scripts-templates"
export DOT_FOLDER_EXTRA="${DOT_FOLDER}/extra"
export DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"
export DOT_FOLDER_ZSH_SCRIPTS="${DOT_FOLDER}/zsh/scripts"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

export GIT_CONFIG_GLOBAL="${DOT_FOLDER_EXTRA}/.gitconfig"
export FZF_DEFAULT_OPTS="--info=hidden --prompt="
export NVM_LAZY_LOAD=true

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export ET_NO_TELEMETRY=1

export PATH="\
/sbin:\
/data/data/com.termux/files/usr/bin:\
/data/data/com.termux/files/usr/bin/applets:\
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
${HOME}/go/bin:\
${PATH}\
"

if [ -n "${TERMUX_VERSION}" ]; then
    export SKIP_NVMRC=true
    export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
    export OPENSSL_DIR=${PREFIX}
fi
