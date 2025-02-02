rem # Disable IP Helper (iphlpsvc)

net stop iphlpsvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE