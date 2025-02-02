rem # Disable SSDP Discovery (SSDPSRV)

net stop SSDPSRV
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f

PAUSE