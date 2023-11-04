rem Disable WMI (Windows Management Instrumentation)
net stop winmgmt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
