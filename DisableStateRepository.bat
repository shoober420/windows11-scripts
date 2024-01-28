rem Disable State Repository Service
REM WARNING: Breaks system configuration settings, like power options
REM WARNING: Breaks GUI, like taskbar, icons, and background)

net stop StateRepository

reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
