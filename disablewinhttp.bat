rem Disable WinHttpAutoProxySvc
net stop WinHttpAutoProxySvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
