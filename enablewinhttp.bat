rem Enable WinHttpAutoProxySvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "2" /f

net start WinHttpAutoProxySvc

PAUSE
