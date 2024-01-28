rem Disable State Repository Service
REM WARNING: break system configuration settings, like power options

net stop StateRepository

reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
