rem # Disable Null service

net stop Null

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "4" /f

PAUSE