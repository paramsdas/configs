$line = "==============="

$user_name = [System.Environment]::GetEnvironmentVariable('user_name')
$user_working_directory = [System.Environment]::GetEnvironmentVariable('user_working_directory')
$user_enable_powershell_prediction = [System.Environment]::GetEnvironmentVariable('user_enable_powershell_prediction')

if ($user_enable_powershell_prediction -ne "") {
  Set-PSReadLineOption -PredictionSource None
}

if ($user_name.Length -eq 0) {
  $user_name = "User"
}

for ($i = 0; $i -lt $user_name.Length; $i++) {
  $line = $line + "="
}

Write-Host 
Write-Host $line
Write-Host -NoNewline "|  Welcome "
Write-Host -NoNewline "$user_name" -ForegroundColor Green
Write-Host "!  |"
Write-Host $line
Write-Host

function prompt {
  [array] $git_status = git status
  $branch_name = ""
  if ($git_status.Length -gt 0) {
    $match = $git_status[0] | Select-String -Pattern '^On branch (.*)$'
    $branch_name = $match.Matches.Groups[1].Value
  }
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  Write-Host -NoNewline "$user_name" -ForegroundColor Green
  if ($branch_name -cne "") {
    Write-Host -NoNewline " [$loc] <$branch_name> :" -ForegroundColor DarkCyan
  }
  else {
    Write-Host -NoNewline " [$loc] :" -ForegroundColor DarkBlue
  }

  return " $([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
}

# Functions and Aliases
function Set-Location-Interactively {
  cd (Get-ChildItem | ForEach-Object -Process { $_.Name } | fzf)
}

Remove-Alias -Name clear
Remove-Alias -Name rm

Set-Alias -Name cdf -Value Set-Location-Interactively
Set-Alias -Name v -Value nvim
Set-Alias -Name la -Value Get-ChildItem
Set-Alias -Name c -Value Clear-Host

function Set-Location-ToWorkspace {
  cd 'D:\workspace'
}

function Edit-Profile {
  v $PROFILE
}

function Edit-NeovimSettings {
  cd ~/AppData/Local/nvim;
  v init.lua;
}

Set-Alias -Name ws -Value Set-Location-ToWorkspace
Set-Alias -Name ep -Value Edit-Profile
Set-Alias -Name ev -Value Edit-NeovimSettings

$PSStyle.FileInfo.Directory = "`e[4;1m"

Invoke-Expression (& { (zoxide init powershell | Out-String) })
