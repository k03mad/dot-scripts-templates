scoop update
scoop update *

$buckets = @(
    'extras',
    'nerd-fonts',
    'scoop-completion https://github.com/Moeologist/scoop-completion',
    'wsl https://git.irs.sh/KNOXDEV/wsl'
)

$buckets | ForEach-Object {
    "\n✨ $_"
    scoop bucket add $_
}

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

$tools | ForEach-Object {
    "\n✨ $_"
    scoop install $_
}
