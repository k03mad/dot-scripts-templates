oh-my-posh --init --shell pwsh --config ~/git/dot-scripts-templates/posh/mad.omp.json | Invoke-Expression

Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
fnm env --use-on-cd | Out-String | Invoke-Expression