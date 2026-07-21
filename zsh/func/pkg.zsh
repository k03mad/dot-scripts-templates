alias aptup="\
    sudo apt-get update \
    && sudo apt-get upgrade \
    && sudo apt-get dist-upgrade \
    && sudo apt-get clean \
    && sudo apt-get autopurge \
"

alias pkgup="\
    pkg update \
    && pkg upgrade \
    && pkg clean \
    && apt autopurge \
"

alias brewup="\
    brew list \
    && brew update \
    && brew upgrade \
    && brew autoremove \
    && brew cleanup -s \
    && brew doctor \
"
alias brewcl="brew remove \$(brew list --formula)"
