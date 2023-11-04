rem Starts and enables GraphicsPerfSvc (improves performance)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start GraphicsPerfSvc

PAUSE
