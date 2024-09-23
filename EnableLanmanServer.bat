rem # Enables LanmanServer (Server service)

reg add "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "2" /f
net start LanmanServer

PAUSE