# shellcheck disable=2116,2154,2191,2164,2207

eval "$(zoxide init zsh)"

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

doh() {
    curl -H 'accept: application/dns-json' "https://cloudflare-dns.com/dns-query?name=$1" | jq .
}

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
    OUTDATED=$(npm -g outdated --parseable --depth=0)

    NPM_FROM=($(echo "$OUTDATED" | cut -d: -f3))
    NPM_TO=($(echo "$OUTDATED" | cut -d: -f4))

    for (( i = 1; i <= $#NPM_FROM; i++ )) do
        if [[ "${NPM_FROM[i]}" != npm@* ]]; then
            printf "\n ✨ %s => %s \n" "${NPM_FROM[i]}" "${NPM_TO[i]}";
            npm i -g "${NPM_TO[i]}";
        fi
    done
}
