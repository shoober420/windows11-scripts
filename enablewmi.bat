rem Enable WMI (Windows Management Instrumentation)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
net start winmgmt

PAUSE
