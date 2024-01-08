REM Enable Windows Firewall

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "2" /f

net start mpssvc

PAUSE
