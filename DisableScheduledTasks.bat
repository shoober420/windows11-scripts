rem # Delete Task Scheduler tasks

schtasks /delete /tn * /f

schtasks /Change /TN "Microsoft\Windows\Wininet\CacheTask" /Disable

schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Disable

PAUSE
