# ——————————————————————————————————————————————
# aliases

alias ds="echo megabytes; du -m | sort -n -r |more"
alias fs="echo megabytes; find . -maxdepth 1 -type d -print | xargs du -sm | sort -rn"

# ——————————————————————————————————————————————
# options

shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist

# ——————————————————————————————————————————————
# vars

export PATH=/usr/local/bin:$PATH
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTIGNORE="&:ls:[bf]g:exit"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoredups:ignorespace

# ——————————————————————————————————————————————
# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

enter_directory() {
    if [ "$PWD" != "$PREV_PWD" ]; then
        PREV_PWD="$PWD";
        if [ -e ".nvmrc" ]; then
            nvm install;
        fi
    fi
}

export PROMPT_COMMAND="enter_directory; $PROMPT_COMMAND"

# ——————————————————————————————————————————————
# autocorrect

eval $(thefuck --alias)

# ——————————————————————————————————————————————
# autocomplete

if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# ——————————————————————————————————————————————
# prompt

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
