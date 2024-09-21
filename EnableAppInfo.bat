rem Enable "Application Information" service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

PAUSE
