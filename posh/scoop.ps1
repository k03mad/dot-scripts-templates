scoop update
scoop update *

scoop bucket add nerd-fonts

$tools = @(
    'curl',
    'firacode-nf',
    'fnm',
    'git',
    'nano'
    'https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json'
)

$tools | ForEach-Object {scoop install $PSItem}
