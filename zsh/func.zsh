# shellcheck disable=SC2206,SC2207,SC2116,SC2154

w() {
    echo "${c[green]}which:${c[reset]}"
    which "$1"
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

gc() {
    gs
    git commit -m "$(echo "$@")"
}

gch() {
    if [ -z "$*" ]; then
        echo "${c[green]}checkout to ${c[magenta]}master${c[reset]}"
        git checkout master
    else
        echo "${c[green]}checkout to branch ${c[blue]}$*${c[reset]}"
        git checkout -b "$@" || git checkout "$@"
    fi
}

ac() {
    as
    arc commit -m "$(echo "$@")"
}

asm() {
    as
    arc submit -m "$(echo "$@")"
}

apr() {
    as
    arc pr create --push -m "$(echo "$@")"
}

ach() {
    if [ -z "$*" ]; then
        echo "${c[green]}checkout to ${c[magenta]}trunk${c[reset]}"
        arc checkout trunk
    else
        echo "${c[green]}checkout to branch ${c[blue]}$*${c[reset]}"
        arc checkout -b "$@" || arc checkout "$@"
    fi
}

chpwd() {
    if [ -z "${SKIP_CHPWD}" ] && command -v lsd &> /dev/null; then
        dls
    fi

    if [ -z "${SKIP_NVMRC}" ] && [ "${PWD}" != "${PREV_PWD}" ]; then
        PREV_PWD="${PWD}"

        if [ -e ".nvmrc" ]; then
            nvm use
        fi
    fi
}

zshup() {
    SKIP_CHPWD=true
    START_PWD=${PWD}

    cd "${DOT_FOLDER_ZSH}" || exit
    git pull
    cd "${START_PWD}" || exit

    unset SKIP_CHPWD
}

npmup() {
    npmls

    echo
    echo -e "\n✨ ${c[green]}npm update${c[reset]}\n"
    echo

    OUTDATED=$(npm outdated -g --parseable --depth=0)

    NPM_FROM=($(echo "$OUTDATED" | cut -d: -f3))
    NPM_FROM=(${NPM_FROM[@]/#npm@*})
    NPM_FROM=(${NPM_FROM[@]/#corepack@*})

    NPM_TO=($(echo "$OUTDATED" | cut -d: -f4))
    NPM_TO=(${NPM_TO[@]/#npm@*})
    NPM_TO=(${NPM_TO[@]/#corepack@*})

    for (( i = 1; i <= $#NPM_FROM; i++ )) do
        echo "✨ ${c[yellow]}${NPM_FROM[i]}${c[reset]} => ${c[green]}${NPM_TO[i]}${c[reset]}"
    done

    if (( ${#NPM_TO[@]} != 0 )); then
        npm i "${NPM_TO[@]}" -g
    fi

    echo
    echo "✨ ${c[green]}pnpm update${c[reset]}"
    echo

    pnpm update -g --latest
}

promdel() {
    curl -X POST -v -g "http://localhost:12000/api/v1/admin/tsdb/delete_series?match[]=$1"
    curl -X POST -v http://localhost:12000/api/v1/admin/tsdb/clean_tombstones
}

fllm() {
    local url="https://shir-man.com/api/free-llm/top-models"

    local resp http_code data
    resp=$(curl -s --max-time 10 -w $'\n__HTTP__%{http_code}' "$url")
    http_code=$(printf '%s\n' "$resp" | tail -n1 | sed 's/__HTTP__//')
    data=$(printf '%s\n' "$resp" | sed '$d')

    if [ "$http_code" != "200" ] || [ -z "$data" ]; then
        echo "${c[bold]}${c[red]}Warning:${c[reset]} could not fetch model list (HTTP $http_code)"
        return 1
    fi

    local parsed updated
    parsed=$(printf '%s\n' "$data" | jq -r '
        ( ( .updatedAt // "n/a" ) as $u
          | "UPDATED\t" + $u ),
        ( .models[] | [ ( .rank // "" ), ( .score // "" ), ( .id // "" ) ] | @tsv )
    ')
    if [ $? -ne 0 ]; then
        echo "${c[bold]}${c[yellow]}Warning:${c[reset]} could not parse model list"
        return 1
    fi

    updated=$(printf '%s\n' "$parsed" | head -n1 | cut -f2-)

    echo
    echo "${c[dim]}────────────────────────────────${c[reset]}"
    printf "${c[bold]}%-4s %-6s %-30s${c[reset]}\n" "RANK" "SCORE" "ID"

    local i=0
    printf '%s\n' "$parsed" | tail -n +2 | while IFS=$'\t' read -r rank score id; do
        i=$((i + 1))
        if [ "$i" -le 3 ]; then
            local rcol="${c[orange]}"
            case "$rank" in
                2) rcol="${c[cyan]}" ;;
                3) rcol="${c[green]}" ;;
            esac
            printf "${c[bold]}${rcol}#%-3s %-5s %-30s${c[reset]}\n" "$rank" "$score" "$id"
        else
            printf "#%-3s %-5s %-30s\n" "$rank" "$score" "$id"
        fi
    done

    echo "${c[dim]}────────────────────────────────${c[reset]}"
    echo
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
    " > /dev/null 2>&1

    ssh opi "
        dig $domain @mik
        echo '═══════════════════════════════════════════'
        echo
        traceroute -m 6 $domain
    " 2>&1
}
