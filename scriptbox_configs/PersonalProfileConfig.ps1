function Set-Location-Interactively {
  cd (Get-ChildItem | ForEach-Object -Process { $_.Name } | fzf)
}

Set-Alias -Name cdf -Value Set-Location-Interactively

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })