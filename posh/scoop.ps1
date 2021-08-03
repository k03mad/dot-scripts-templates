scoop update
scoop update *

$buckets = @(
    'extras',
    'nerd-fonts',
    'scoop-completion https://github.com/Moeologist/scoop-completion',
    'wsl https://git.irs.sh/KNOXDEV/wsl'
)

$buckets | ForEach-Object {
    $name, $repo = $_.split(' ')

    Write-Output "`n> $name"
    scoop bucket add $name $repo
}

$tools = @(
    'aria2',
    'curl',
    'fnm',
    'git',
    'nano'
    'scoop-completion',
    'https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json'
)

$sudo_tools = @(
    'firacode-nf'
)

$tools | ForEach-Object {
    Write-Output "`n> $_"
    scoop install $_
}

$sudo_tools | ForEach-Object {
    Write-Output "`n> $_"
    sudo scoop install $_
}
