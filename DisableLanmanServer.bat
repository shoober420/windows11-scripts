rem # Disables LanmanServer (Server service)
rem # Fixes black screen when SecurityAccountManager is disabled

net stop LanmanServer
reg add "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f

PAUSE