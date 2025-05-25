rem # Enable Null service

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "2" /f

net start Null

PAUSE