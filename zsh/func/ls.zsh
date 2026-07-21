alias lsd="lsd -lA --group-dirs first --size short --date '+[%d.%m.%y %X]'"
alias sls="lsd --blocks date,size,name --total-size --sizesort"
alias tls="lsd --blocks date,size,name --total-size --tree --ignore-glob node_modules --ignore-glob .git"

dls() { lsd --blocks date,size,name "$@"; }

