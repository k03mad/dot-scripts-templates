alias sudo="sudo "
alias s="sudo \$(fc -ln -1)"

alias q="exit"
alias й=q

alias del="rm -rfv"

alias ports="sudo lsof -i -P -n | grep LISTEN"

chpwd() {
    if [ -z "${SKIP_CHPWD}" ] && [ -t 1 ] && command -v lsd &> /dev/null; then
        dls
    fi

    if [ -z "${SKIP_NVMRC}" ] && [ "${PWD}" != "${PREV_PWD}" ]; then
        PREV_PWD="${PWD}"

        if [ -e ".nvmrc" ]; then
            nvm use
        fi
    fi
}

w() {
    echo "${c[green]}which:${c[reset]}"
    which -a "$1"
    echo
    echo "${c[yellow]}where:${c[reset]}"
    where "$1"
}

tldr() {
    curl "cheat.sh/$1"
}

ipi() {
    curl -s "https://ipinfo.io/widget/demo/${1:-$(curl -s https://ipecho.net/plain)}" \
        -H 'referer: https://ipinfo.io/' \
        | jq '.data' \
        | jq --arg delim '.' 'reduce (tostream|select(length==2)) as $i ({};.[[$i[0][]|tostring]|join($delim)] = $i[1])'
}

promdel() {
    curl -X POST -v -g "http://localhost:12000/api/v1/admin/tsdb/delete_series?match[]=$1"
    curl -X POST -v http://localhost:12000/api/v1/admin/tsdb/clean_tombstones
}

fwd() {
    if [[ $# -eq 0 ]]; then
        return 1
    fi

    local domain="$1"
    shift
    local comment="$*"

    ssh mik "
        /ip dns static add type=FWD forward-to=toVpn address-list=tovpnTemp match-subdomain=yes name=$domain comment=\"$comment\"
        /ip dns cache flush
        /ip dns static print where name="$domain"
    " 2>&1

    ssh opi "
        dig $domain @mik
        echo '═══════════════════════════════════════════'
        echo
        traceroute -m 3 $domain
    " 2>&1
}
