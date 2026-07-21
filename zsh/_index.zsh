dir=${funcsourcetrace[1]%/*}

source "${dir}/env.zsh"
source "${HOME}/.env.local.zsh" 2> /dev/null
source "${HOME}/.env.work.zsh" 2> /dev/null

source "${dir}/func/_common.zsh"
source "${dir}/func/adb.zsh"
source "${dir}/func/arc.zsh"
source "${dir}/func/download.zsh"
source "${dir}/func/git.zsh"
source "${dir}/func/ls.zsh"
source "${dir}/func/mac.zsh"
source "${dir}/func/node.zsh"
source "${dir}/func/pkg.zsh"
source "${dir}/func/service.zsh"
source "${dir}/func/zsh.zsh"

source "${dir}/omz.zsh"
source "${dir}/p10k.zsh"
