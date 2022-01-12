# shellcheck source=/dev/null disable=2154

dir=${funcsourcetrace[1]%/*}

source "${dir}/env.sh"

source "${dir}/omz.sh"
source "${dir}/p10k.sh"

source "${dir}/alias.sh"
source "${dir}/func.sh"

[[ -f "${HOME}/.workrc" ]] && source "${HOME}/.keyrc"
[[ -f "${HOME}/.workrc" ]] && source "${HOME}/.workrc"

echo "debug"

if [ -n "${IS_CLOUD}" ] && [ -z "${SSH_CLIENT}" ]; then
    source "${DOT_FOLDER_ZSH}/cloud.sh"
fi
