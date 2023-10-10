rem Enable WMI (Windows Management Instrumentation)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

PAUSE
