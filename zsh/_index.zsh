dir=${funcsourcetrace[1]%/*}

source "${HOME}/.env.local.zsh" 2> /dev/null
source "${HOME}/.env.work.zsh" 2> /dev/null

source "${dir}/omz.zsh"
source "${dir}/p10k.zsh"

for f in "${dir}"/func/*.zsh(N); do
    source "$f"
done
