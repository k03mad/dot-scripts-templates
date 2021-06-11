scoop update
scoop update *

$buckets = @(
    'extras',
    'nerd-fonts',
    'scoop-completion https://github.com/Moeologist/scoop-completion',
    'wsl https://git.irs.sh/KNOXDEV/wsl'
)

$buckets | ForEach-Object {scoop bucket add $PSItem}

$tools = @(
    'aria2',
    'curl',
    'firacode-nf',
    'fnm',
    'git',
    'nano'
    'scoop-completion',
    'https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json'
)

$tools | ForEach-Object {scoop install $PSItem}
