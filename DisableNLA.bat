rem Disable "Network Location Awareness" service

net stop NlaSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
