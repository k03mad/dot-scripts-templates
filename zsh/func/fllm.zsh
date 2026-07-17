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

