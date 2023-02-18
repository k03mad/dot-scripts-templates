# shellcheck disable=2116,2154,2191,2164,2206,2207

ARIA_ARGS=(
    --file-allocation=falloc
    --max-connection-per-server=3
    --max-concurrent-downloads=3
    --split=3
    --max-tries=120
    --retry-wait=5
    --continue
    --remote-time
)

download() {
    aria2c "$@" "${ARIA_ARGS[@]}"
}

youvid() {
    youtube-dl -o "youtube-dl/%(uploader)s - %(title)s.%(ext)s" \
        --add-metadata \
        --embed-subs \
        --external-downloader aria2c \
        --external-downloader-args "$(echo "${ARIA_ARGS[@]}")" "$@"
}

youmus() {
    youtube-dl -o "youtube-dl/%(uploader)s - %(title)s.%(ext)s" \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        --add-metadata \
        --embed-thumbnail \
        --external-downloader aria2c \
        --external-downloader-args "$(echo "${ARIA_ARGS[@]}")" "$@"
}

doh() {
    dog "$1" --json --time --https @https://1.1.1.1/dns-query | jq
}

dot() {
    dog "$1" --json --time --tls @1.1.1.1 | jq
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
    if [ -z "${SKIP_CHPWD}" ]; then
        dls
    fi

    if [ -z "${SKIP_NVMRC}" ]; then
        if [ "${PWD}" != "${PREV_PWD}" ]; then
            PREV_PWD="${PWD}"

            if [ -e ".nvmrc" ]; then
                nvm use
            fi
        fi
    fi
}

zshup() {
    SKIP_CHPWD=true
    START_PWD=${PWD}

    cd "${DOT_FOLDER_ZSH}"
    git pull
    cd "${START_PWD}"

    unset SKIP_CHPWD
}

npmup() {
    OUTDATED=$(npm outdated -g --parseable --depth=0)

    NPM_FROM=($(echo "$OUTDATED" | cut -d: -f3))
    NPM_FROM_FILTERED=(${NPM_FROM[@]//npm@*})

    NPM_TO=($(echo "$OUTDATED" | cut -d: -f4))
    NPM_TO_FILTERED=(${NPM_TO[@]//npm@*})

    for (( i = 1; i <= $#NPM_FROM_FILTERED; i++ )) do
        printf "✨ %s => %s\n" "${NPM_FROM_FILTERED[i]}" "${NPM_TO_FILTERED[i]}";
    done

    if (( ${#NPM_TO_FILTERED[@]} != 0 )); then
        npm i "${NPM_TO_FILTERED[@]}" -g
    fi
}
