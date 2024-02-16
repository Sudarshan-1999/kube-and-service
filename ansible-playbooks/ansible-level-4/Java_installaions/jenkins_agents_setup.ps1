# Retrieve the scheduled task
$scheduledTask = Get-ScheduledTask -TaskPath '\' | Where-Object { $_.TaskName -match 'Jenkins' }
# Check if the task is found
if ($scheduledTask) {
    # Create a new action object with the desired properties
    $javaPath = "C:\Program Files\Java\jdk-21\bin\java.exe"
    $arguments = "-jar D:\agent.jar"
    $newAction = New-ScheduledTaskAction -Execute $javaPath -Argument $arguments

    # Update the scheduled task with the new action
    Set-ScheduledTask -TaskName $scheduledTask.TaskName -TaskPath $scheduledTask.TaskPath -Action $newAction

    Restart-ScheduledTask -TaskName $scheduledTask.TaskName -TaskPath $scheduledTask.TaskPath
} else {
    Write-Host "Scheduled task 'jenkins' not found."
}