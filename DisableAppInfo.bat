rem Disable "Application Information" service
net stop Appinfo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
