alias sudo="sudo "
alias s="sudo \$(fc -ln -1)"

alias q="exit"
alias й=q

alias del="rm -rfv"

alias ports="sudo lsof -i -P -n | grep LISTEN"

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
    " > /dev/null 2>&1

    ssh opi "
        dig $domain @mik
        echo '═══════════════════════════════════════════'
        echo
        traceroute -m 6 $domain
    " 2>&1
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


trgeo() {
    if [[ $# -lt 1 ]]; then
        echo "Использование: trgeo <домен или IP>" >&2
        return 1
    fi

    local TARGET="$1"

    for cmd in traceroute curl; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo "Ошибка: команда '$cmd' не найдена. Установите её и повторите." >&2
            return 1
        fi
    done

    local c_hop c_ip c_dom c_geo c_net c_as c_rst
    if [[ -t 1 ]]; then
        c_hop="${c[cyan]}"     # номер хопа
        c_ip="${c[bold]}"      # IP
        c_dom="${c[yellow]}"   # домен
        c_geo="${c[green]}"    # гео
        c_net="${c[magenta]}"  # провайдер
        c_as="${c[blue]}"      # ASN
        c_rst="${c[reset]}"
    else
        c_hop= c_ip= c_dom= c_geo= c_net= c_as= c_rst=
    fi

    local LAST_HOP="" hlabel=""
    local GEO_COUNTRY GEO_REGION GEO_CITY GEO_ISP GEO_ORG GEO_ASN GEO_FLAG
    typeset -A GEO_CACHE=()

    is_private() {
        local ip="$1" o1 o2 o3 o4
        IFS=. read -r o1 o2 o3 o4 <<< "$ip"
        [[ $o1 -eq 10 ]] && return 0
        [[ $o1 -eq 127 ]] && return 0
        [[ $o1 -eq 169 && $o2 -eq 254 ]] && return 0
        [[ $o1 -eq 172 && $o2 -ge 16 && $o2 -le 31 ]] && return 0
        [[ $o1 -eq 192 && $o2 -eq 168 ]] && return 0
        return 1
    }

    fmt_ip() {
        local ip="$1" dom="$2"
        if [[ -n "$dom" ]]; then
            printf '%s%s%s %s%s%s' "$c_ip" "$ip" "$c_rst" "$c_dom" "$dom" "$c_rst"
        else
            printf '%s%s%s' "$c_ip" "$ip" "$c_rst"
        fi
    }

    set_hop_label() {
        if [[ "$1" != "$LAST_HOP" ]]; then
            LAST_HOP="$1"; hlabel="$1"
        else
            hlabel=""
        fi
    }

    country_flag() {
        local cc="$1" out="" i ch n cp b1 b2 b3 b4
        for ((i = 0; i < ${#cc}; i++)); do
            ch=$(printf '%s' "${cc:$i:1}" | tr 'a-z' 'A-Z')
            n=$(printf '%d' "'$ch")
            cp=$((0x1F1E6 + n - 65))
            b1=$(( (cp >> 18 & 0x07) | 0xF0 ))
            b2=$(( (cp >> 12 & 0x3F) | 0x80 ))
            b3=$(( (cp >> 6  & 0x3F) | 0x80 ))
            b4=$(( (cp & 0x3F)       | 0x80 ))
            out+=$(printf '\\x%02x\\x%02x\\x%02x\\x%02x' "$b1" "$b2" "$b3" "$b4")
        done
        printf "$out"
    }

    geo_fetch() {
        local ip="$1" data tries=0
        if [[ -n "${GEO_CACHE[$ip]:-}" ]]; then
            IFS='|' read -r GEO_COUNTRY GEO_REGION GEO_CITY GEO_ISP GEO_ORG GEO_ASN GEO_FLAG <<< "${GEO_CACHE[$ip]}"
            return 0
        fi
        while (( tries < 3 )); do
            data=$(curl -s --max-time 5 "http://ip-api.com/json/${ip}?fields=status,country,countryCode,regionName,city,isp,org,as" 2>/dev/null) || { sleep 1; tries=$((tries+1)); continue; }
            echo "$data" | grep -q '"status":"success"' || { sleep 1; tries=$((tries+1)); continue; }
            GEO_COUNTRY=$(echo "$data" | grep -o '"country":"[^"]*"'     | head -1 | sed 's/"country":"//;s/"//')
            GEO_REGION=$(echo  "$data" | grep -o '"regionName":"[^"]*"'  | head -1 | sed 's/"regionName":"//;s/"//')
            GEO_CITY=$(echo    "$data" | grep -o '"city":"[^"]*"'        | head -1 | sed 's/"city":"//;s/"//')
            GEO_ISP=$(echo     "$data" | grep -o '"isp":"[^"]*"'         | head -1 | sed 's/"isp":"//;s/"//')
            GEO_ORG=$(echo     "$data" | grep -o '"org":"[^"]*"'         | head -1 | sed 's/"org":"//;s/"//')
            GEO_ASN=$(echo     "$data" | grep -o '"as":"[^"]*"'          | head -1 | sed 's/"as":"//;s/"//')
            GEO_FLAG=$(country_flag "$(echo "$data" | grep -o '"countryCode":"[^"]*"' | head -1 | sed 's/"countryCode":"//;s/"//')")
            GEO_CACHE[$ip]="${GEO_COUNTRY}|${GEO_REGION}|${GEO_CITY}|${GEO_ISP}|${GEO_ORG}|${GEO_ASN}|${GEO_FLAG}"
            return 0
        done
        return 1
    }

    geo_print() {
        [[ -z "$GEO_COUNTRY" ]] && return
        local geo="${GEO_COUNTRY:-}, ${GEO_REGION:-}"
        [[ -n "$GEO_CITY" && "$GEO_CITY" != "$GEO_REGION" ]] && geo+=", $GEO_CITY"

        echo "      ${c_geo}— ${GEO_FLAG} ${geo}${c_rst}"
        [[ -n "$GEO_ASN" ]] && echo "      ${c_as}— ${GEO_ASN}${c_rst}"

        local a="${(L)GEO_ASN}" i="${(L)GEO_ISP}" o="${(L)GEO_ORG}"
        local show_isp=1 show_org=1
        [[ -z "$GEO_ISP" ]] && show_isp=0
        [[ -z "$GEO_ORG" ]] && show_org=0
        [[ $show_isp -eq 1 && -n "$a" && "$a" == *"$i"* ]] && show_isp=0
        [[ $show_isp -eq 1 && -n "$o" && "$o" == *"$i"* ]] && show_isp=0
        [[ $show_org -eq 1 && -n "$a" && "$a" == *"$o"* ]] && show_org=0
        [[ $show_org -eq 1 && -n "$i" && "$i" == *"$o"* ]] && show_org=0
        [[ $show_isp -eq 1 ]] && echo "      ${c_net}— ${GEO_ISP}${c_rst}"
        [[ $show_org -eq 1 ]] && echo "      ${c_net}— ${GEO_ORG}${c_rst}"
    }

    print_priv() {
        (( ${#priv[@]} == 0 )) && return
        local joined="$(printf '%s, ' "${priv[@]}")"
        joined="${joined%, }"
        set_hop_label "$hop"
        printf '  %s%2s%s  %s%s%s\n' "$c_hop" "$hlabel" "$c_rst" "$c_ip" "$joined" "$c_rst"
    }

    echo

    traceroute -w 5 -m 30 "$TARGET" 2>/dev/null | while IFS= read -r line; do
        [[ "$line" =~ ^traceroute\ to ]] && continue

        if [[ "$line" =~ ^[[:space:]]*([0-9]+)[[:space:]] ]]; then
            local hop="${match[1]}"

            local raw=()
            while IFS= read -r p; do
                [[ -z "$p" ]] && continue
                local ip=$(echo "$p" | grep -oE '\(([0-9]{1,3}\.){3}[0-9]{1,3}\)' | tr -d '()' | head -1)
                local dom=$(echo "$p" | sed -E 's/ \([0-9.]+\)//')
                [[ "$dom" =~ [a-zA-Z] ]] || dom=""
                raw+=("$ip|$dom")
            done < <(echo "$line" | grep -oE '[a-zA-Z0-9_.-]+ \(([0-9]{1,3}\.){3}[0-9]{1,3}\)')

            while IFS= read -r b; do
                [[ -n "$b" ]] && raw+=("$b|")
            done < <(echo "$line" | sed -E 's/\(([0-9]{1,3}\.){3}[0-9]{1,3}\)//g' | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')

            ((${#raw[@]} == 0)) && continue

            local entries=() seen=()
            for entry in "${raw[@]}"; do
                local ip=${entry%|*}; dom=${entry#*|}
                local skip=0
                for s in "${seen[@]}"; do
                    [[ "$s" == "$ip" ]] && skip=1 && break
                done
                ((skip)) && continue
                seen+=("$ip")
                entries+=("$ip|$dom")
            done

            local pub_ip=() pub_dom=() pub_sig=() priv=()
            for entry in "${entries[@]}"; do
                local ip=${entry%|*}; dom=${entry#*|}
                if is_private "$ip"; then
                    priv+=("$ip")
                else
                    if geo_fetch "$ip"; then
                        local sig="${GEO_COUNTRY}|${GEO_REGION}|${GEO_CITY}|${GEO_ISP}|${GEO_ASN}"
                    else
                        sig=""
                    fi
                    pub_ip+=("$ip"); pub_dom+=("$dom"); pub_sig+=("$sig")
                fi
            done

            if (( ${#pub_ip[@]} == 0 )); then
                local joined="$(printf '%s, ' "${priv[@]}")"
                joined="${joined%, }"
                set_hop_label "$hop"
                printf '  %s%2s%s  %s%s%s\n' "$c_hop" "$hlabel" "$c_rst" "$c_ip" "$joined" "$c_rst"
                echo
                continue
            fi

            local same=1 first_sig=""
            for s in "${pub_sig[@]}"; do
                [[ -z "$s" ]] && { same=0; break; }
                [[ -z "$first_sig" ]] && first_sig="$s"
                [[ "$s" != "$first_sig" ]] && { same=0; break; }
            done

            if (( same == 1 )); then
                local list=()
                for (( i = 1; i <= $#pub_ip; i++ )); do
                    list+=("$(fmt_ip "${pub_ip[i]}" "${pub_dom[i]}")")
                done
                local joined="$(printf '%s, ' "${list[@]}")"
                joined="${joined%, }"
                set_hop_label "$hop"
                printf '  %s%2s%s  %s\n' "$c_hop" "$hlabel" "$c_rst" "$joined"
                geo_print
                if (( ${#priv[@]} > 0 )); then
                    echo
                    print_priv
                fi
            else
                local done=() gi=1
                while (( gi <= $#pub_ip )); do
                    local skip=0
                    for d in "${done[@]}"; do
                        [[ "$d" == "$gi" ]] && skip=1 && break
                    done
                    (( skip )) && { gi=$((gi+1)); continue }
                    local group=() g_sig="${pub_sig[gi]}"
                    for (( j = gi; j <= $#pub_ip; j++ )); do
                        [[ "${pub_sig[j]}" == "$g_sig" ]] || continue
                        group+=("$(fmt_ip "${pub_ip[j]}" "${pub_dom[j]}")")
                        done+=("$j")
                    done
                    local joined="$(printf '%s, ' "${group[@]}")"
                    joined="${joined%, }"
                    (( gi > 1 )) && echo
                    set_hop_label "$hop"
                    printf '  %s%2s%s  %s\n' "$c_hop" "$hlabel" "$c_rst" "$joined"
                    geo_fetch "${pub_ip[gi]}" && geo_print
                    gi=$((gi+1))
                done
                if (( ${#priv[@]} > 0 )); then
                    echo
                    print_priv
                fi
            fi
            echo
        fi
    done

    echo
}
