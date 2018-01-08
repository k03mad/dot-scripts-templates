# ——————————————————————————————————————————————
# prompt

git_branch() {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_status() {
    local status="$(git status --porcelain 2>/dev/null)"
    local output=''
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}S"
    [[ -n $(git status -sb|grep -E "\[ahead .+\]") ]] && output="${output}P"
    [[ -n $output ]] && output="|$output"
    echo $output
}

git_color() {
    local staged=$([[ $1 =~ \+ ]] && echo yes)
    local dirty=$([[ $1 =~ [!\?] ]] && echo yes)
    local needs_push=$([[ $1 =~ P ]] && echo yes)
    if [[ -n $staged ]] && [[ -n $dirty ]]; then
        echo -e '\033[1;33m'
    elif [[ -n $staged ]]; then
        echo -e '\033[1;32m'
    elif [[ -n $dirty ]]; then
        echo -e '\033[1;31m'
    elif [[ -n $needs_push ]]; then
        echo -e '\033[1;34m'
    else
        echo -e '\033[1;37m'
    fi
}

git_prompt() {
    local branch=$(git_branch)
    if [[ -n $branch ]]; then
        local state=$(git_status)
        local color=$(git_color $state)
        echo -e "\x01$color\x02 ($branch$state)\x01\033[00m\x02"
    fi
}

export PS1="\D{%H:%M} $(whoami) \[\033[1;94m\]\w\$(git_prompt) \[\033[1;97m\]>\[\033[0m\] "

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
