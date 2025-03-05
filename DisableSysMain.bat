rem # Disable SysMain service (SuperFetch)

net stop SysMain
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f

PAUSE