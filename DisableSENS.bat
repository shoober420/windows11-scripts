rem # Disable System Event Notification Service (SENS)

net stop SENS
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "4" /f

PAUSE