export DOT_FOLDER="${HOME}/git/dot-scripts-templates"
export DOT_FOLDER_ZSH="${DOT_FOLDER}/zsh"
export DOT_FOLDER_ZSH_SCRIPTS="${DOT_FOLDER}/zsh/scripts"

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
export ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM}/plugins"
export ZSH_CUSTOM_THEMES="${ZSH_CUSTOM}/themes"

export NVM_AUTO_USE=true

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export ET_NO_TELEMETRY=1

export PATH="\
/sbin:\
/usr/local/bin:\
/usr/local/go/bin:\
/usr/local/opt/curl/bin:\
/usr/local/opt/findutils/libexec/gnubin:\
/usr/local/opt/maven@3.5/bin:\
/usr/local/sbin:\
/usr/sbin:\
/data/data/com.termux/files/usr/bin:\
/data/data/com.termux/files/usr/bin/applets:\
${HOME}/.cargo/bin:\
${HOME}/.local/bin:\
${HOME}/go/bin:\
${PATH}\
"

if [ -n "${TERMUX_VERSION}" ]; then
    unset NVM_AUTO_USE
    export OPENSSL_DIR=${PREFIX}
fi
