rem # Disable TCP/IP NetBIOS Helper (lmhosts)

net stop lmhosts
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f

PAUSE