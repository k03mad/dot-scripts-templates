oh-my-posh --init --shell pwsh --config ~/git/dot-scripts-templates/posh/mad.omp.json | Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression
