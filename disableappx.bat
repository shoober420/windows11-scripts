rem Disable AppXSvc
net stop AppXSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
