rem # Disables Secondary Logon service for "Run as administrator"

net stop seclogon

reg add "HKLM\SYSTEM\CurrentControlSet\Services\seclogon" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
