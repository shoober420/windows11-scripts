rem # Enable System Event Notification Service (SENS)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "2" /f
net start SENS

PAUSE