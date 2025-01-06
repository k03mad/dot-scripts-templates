# shellcheck source=/dev/null disable=SC2154

dir=${funcsourcetrace[1]%/*}

[[ -s "${HOME}/.keyrc" ]] && source "${HOME}/.keyrc"
[[ -s "${HOME}/.workrc" ]] && source "${HOME}/.workrc"

source "${dir}/env.sh"

source "${dir}/alias.sh"
source "${dir}/func.sh"

source "${dir}/omz.sh"
source "${dir}/p10k.sh"

source "${dir}/start.sh"
