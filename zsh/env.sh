export DOT_FOLDER="${HOME}/git/dot-scripts-templates"
export DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"
export DOT_FOLDER_ZSH_SCRIPTS="${DOT_FOLDER}/zsh/scripts"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export ET_NO_TELEMETRY=1

export TERMUX_BIN="/data/data/com.termux/files/usr/bin"

export PATH="\
/sbin:\
/usr/local/bin:\
/usr/local/go/bin:\
/usr/local/opt/curl/bin:\
/usr/local/opt/findutils/libexec/gnubin:\
/usr/local/sbin:\
/usr/sbin:\
${HOME}/.cargo/bin:\
${HOME}/.local/bin:\
${HOME}/go/bin:\
${TERMUX_BIN}:\
${TERMUX_BIN}/applets:\
${PATH}\
"

if [ -n "${TERMUX_VERSION}" ]; then
    export SKIP_NVMRC=true
    export NO_SUDO=true
    export OPENSSL_DIR=${PREFIX}
fi
