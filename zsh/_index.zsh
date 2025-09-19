# shellcheck source=/dev/null disable=SC2154

dir=${funcsourcetrace[1]%/*}

source "${dir}/env.zsh"
source "${HOME}/.env.local.zsh" 2> /dev/null
source "${HOME}/.env.work.zsh" 2> /dev/null

source "${dir}/alias.zsh"
source "${dir}/func.zsh"

source "${dir}/omz.zsh"
source "${dir}/p10k.zsh"
