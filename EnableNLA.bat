rem Enable "Network Location Awareness" service (fixes broken internet)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "2" /f

net start NlaSvc

PAUSE
