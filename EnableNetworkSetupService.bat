rem # Enable Network Setup Service (NetSetupSvc)
rem # required for Windows Updates
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d "3" /f
net start NetSetupSvc

PAUSE