# shellcheck source=/dev/null disable=2154

dir=${funcsourcetrace[1]%/*}

source "${dir}/env.sh"

source "${dir}/omz.sh"
source "${dir}/p10k.sh"

source "${dir}/alias.sh"
source "${dir}/func.sh"

source "${HOME}/.keyrc"
source "${HOME}/.workrc" || true

echo "debug"

if [ -n "${IS_CLOUD}" ] && [ -z "${SSH_CLIENT}" ]; then
    source "${DOT_FOLDER_ZSH}/cloud.sh"
fi
