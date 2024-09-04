$user = "param"
$actions = (New-ScheduledTaskAction -Execute "$PSScriptRoot\scoop_update.bat")
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay 00:00:30 -User $user
$taskPath = "\CustomTasks\"
$taskName = "UpdateScoopAndStartPowerToys"

$task = New-ScheduledTask -Action $actions -Trigger $trigger

Register-ScheduledTask -TaskName $taskName -TaskPath $taskPath -InputObject $task -User $user