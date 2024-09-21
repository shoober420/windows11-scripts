rem # Disable Network Setup Service (NetSetupSvc)
rem # required for Windows Updates
net stop NetSetupSvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE