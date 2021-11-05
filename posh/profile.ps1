oh-my-posh --init --shell pwsh --config ~/git/dot-scripts-templates/posh/mad.omp.json | Invoke-Expression

Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

fnm env --use-on-cd | Out-String | Invoke-Expression

Function UpdateDot {
    $current = $pwd
    Set-Location ~\git\dot-scripts-templates
    git pull
    Set-Location $current
}

Set-Alias -Name zshup -Value UpdateDot
Set-Alias -Name scoopup -Value ~/git/dot-scripts-templates/posh/scoop.ps1
Set-Alias -Name wingetrm -Value ~/git/dot-scripts-templates/posh/winget.ps1
