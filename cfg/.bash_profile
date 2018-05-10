# ——————————————————————————————————————————————
# aliases

alias ..="cd .."
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias cat="ccat"
alias ds="echo megabytes; du -m | sort -n -r |more"
alias fs="echo megabytes; find . -maxdepth 1 -type d -print | xargs du -sm | sort -rn"
alias nvmup="nvm install node --reinstall-packages-from=node && npm i npm -g"
alias reload="exec ${SHELL} -l"
alias treels="tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX"
eval $(thefuck --alias)

# ——————————————————————————————————————————————
# options

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s nocaseglob

# ——————————————————————————————————————————————
# vars

export CLICOLOR=1
export HISTFILESIZE=20000
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8
export LSCOLORS=GxFxCxDxBxegedabagaced
export MANPAGER='less -X'
export PATH=/usr/local/bin:$PATH
export PATH=$(brew --prefix curl)/bin:$PATH
HISTCONTROL=ignoredups:ignorespace
PROMPT_COMMAND='history -a'

# ——————————————————————————————————————————————
# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

enter_directory() {
    if [ "$PWD" != "$PREV_PWD" ]; then
        PREV_PWD="$PWD"
        if [ -e ".nvmrc" ]; then
            nvm install "$(cat .nvmrc)" --reinstall-packages-from=node
        fi
    fi
}

export PROMPT_COMMAND="enter_directory; $PROMPT_COMMAND"

# ——————————————————————————————————————————————
# autocomplete

if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# ——————————————————————————————————————————————
# prompt

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix bash-git-prompt)/share
    GIT_PROMPT_PREFIX=""
    GIT_PROMPT_SUFFIX=""
    GIT_PROMPT_SEPARATOR=" "
    GIT_PROMPT_COMMAND_OK="\[\033[1;32m\]\D{%H:%M} $(whoami)\[\033[0m\]"
    GIT_PROMPT_END_USER="\n\[\033[1;97m\]>\[\033[0m\] "
    GIT_PROMPT_BRANCH="\[\033[0;97m\]"
    GIT_PROMPT_STAGED=" staged: "
    GIT_PROMPT_CONFLICTS=" conflicts: "
    GIT_PROMPT_CHANGED=" changed: "
    GIT_PROMPT_UNTRACKED=" untracked: "
    GIT_PROMPT_STASHED=" stashed: "
    GIT_PROMPT_CLEAN=""
    GIT_PROMPT_SYMBOLS_AHEAD=" ahead: "
    GIT_PROMPT_SYMBOLS_BEHIND=" behind: "
    GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=" "
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
