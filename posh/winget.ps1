$uninstall = @(
    'extras',
    'nerd-fonts',
    'scoop-completion https://github.com/Moeologist/scoop-completion',
    'wsl https://git.irs.sh/KNOXDEV/wsl'
)

$uninstall | ForEach-Object {
    Write-Output "`nrem > $_"
    winget uninstall $_
}
