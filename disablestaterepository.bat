rem Disable State Repository Service
net stop StateRepository

reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
