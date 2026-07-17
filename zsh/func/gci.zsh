gci() {
    if [ -z "${OPENROUTER_API_KEY}" ]; then
        echo "${c[bold]}${c[red]}Error:${c[reset]} OPENROUTER_API_KEY is not set"
        return 1
    fi

    echo "${c[green]}generating commit message…${c[reset]}"

    local diff
    diff=$(git diff --staged)
    if [ -z "$diff" ]; then
        echo "${c[bold]}${c[red]}Error:${c[reset]} no staged changes (git add)"
        return 1
    fi

    local prompt="Write an accurate git commit message reflecting the actual change, not just which files were touched. Use Conventional Commits format: <type>(<scope>): <subject>, where type ∈ {feat,fix,docs,style,refactor,perf,test,build,ci,chore,revert}. Subject up to 50 chars, no description. Reply with a single line only, no quotes or explanation. Changes:\n$diff"

    local resp msg
    local attempt tries=4
    for (( attempt = 1; attempt <= tries; attempt++ )); do
        resp=$(curl -s "https://openrouter.ai/api/v1/chat/completions" \
            -H "Authorization: Bearer ${OPENROUTER_API_KEY}" \
            -H "Content-Type: application/json" \
            -d "$(jq -n --arg p "$prompt" '{
                model: "openrouter/free",
                messages: [{ role: "user", content: $p }]
            }')")

        msg=$(printf '%s\n' "$resp" | jq -r '.choices[0].message.content // empty' 2>/dev/null)

        if [ -n "$msg" ]; then
            break
        fi

        local code
        code=$(printf '%s\n' "$resp" | jq -r '.error.code // empty' 2>/dev/null)
        if [ "$code" = "429" ] && [ "$attempt" -lt "$tries" ]; then
            echo "${c[yellow]}rate-limited, retrying (${attempt}/${tries})…${c[reset]}"
            sleep 3
        fi
    done

    if [ -z "$msg" ]; then
        local emsg ecode eprov
        emsg=$(printf '%s\n' "$resp" | jq -r '.error.message // empty' 2>/dev/null)
        ecode=$(printf '%s\n' "$resp" | jq -r '.error.code // empty' 2>/dev/null)
        eprov=$(printf '%s\n' "$resp" | jq -r '.error.metadata.provider_name // empty' 2>/dev/null)

        echo "${c[bold]}${c[red]}Error:${c[reset]} failed to get message from the model"
        [ -n "$ecode" ] && echo "  ${c[red]}code:${c[reset]} $ecode"
        [ -n "$eprov" ] && echo "  ${c[red]}provider:${c[reset]} $eprov"
        if [ -n "$emsg" ]; then
            echo "  ${c[red]}reason:${c[reset]} $emsg"
        else
            echo "  ${c[dim]}raw response:${c[reset]}"
            printf '%s\n' "$resp" | head -c 800
            echo
        fi
        return 1
    fi

    echo
    echo "${c[dim]}────────────────────────────────────────${c[reset]}"
    echo "  ${c[bold]}${c[yellow]}Suggested commit:${c[reset]}"
    echo "  ${c[green]}$msg${c[reset]}"
    echo "${c[dim]}────────────────────────────────────────${c[reset]}"
    echo
    echo "  ${c[green]}[Enter]${c[reset]} apply   ${c[red]}[q]${c[reset]} quit"
    echo -n "${c[bold]}▶ ${c[reset]}"

    local key
    if ! read -r -s -k 1 key; then
        echo
        echo "${c[red]}Aborted${c[reset]}"
        return 1
    fi
    echo "$key"

    if [ "$key" = "q" ] || [ "$key" = "Q" ]; then
        echo "${c[red]}Aborted${c[reset]}"
        return 1
    fi
    if [ -n "$key" ] && [ "$key" != $'\n' ]; then
        echo "${c[red]}Aborted${c[reset]}"
        return 1
    fi

    gs
    git commit -m "$msg"
}

