rem # Enable SysMain service (SuperFetch)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "2" /f
net start SysMain

PAUSE
