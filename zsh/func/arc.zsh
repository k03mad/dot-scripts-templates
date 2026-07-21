alias aa="arc add . && as"
alias abd="arc branch | grep -v trunk | xargs -L 1 arc branch -D"
alias am="arc mount ~/arcadia"
alias ap="arc push"
alias apl="arc pull"
alias arh="arc reset --hard --force"
alias as="arc status -s"
alias act="arc checkout trunk"

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
