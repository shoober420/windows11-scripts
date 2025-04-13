# Disable All Scheduled Tasks

# Requires EnableTaskScheduler.bat to run

Get-ScheduledTask | Disable-ScheduledTask

cmd /k 'pause'