REM Disable Windows Firewall

net stop mpssvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
