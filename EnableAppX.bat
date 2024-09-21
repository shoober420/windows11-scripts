rem # Enable AppXSvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "2" /f

net start AppXSvc

PAUSE
