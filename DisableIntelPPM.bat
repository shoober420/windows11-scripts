rem # Disable Intel SpeedStep Technology (Intel Processor Power Management)

rem # Disable for constant CPU max frequency

rem # Causes "Code 32" error in Device Manager for CPU, this is safe and can be ignored

rem # Shows wrong frequency in Task Manager, use CPU-Z or HWMonitor for true frequency

rem # NEEDS TO BE ENABLED FOR MAX TURBOBOOST FREQUENCIES IN CERTAIN LIMITED BIOS

PAUSE

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm" /v "Start" /t REG_DWORD /d "2" /f

sc config intelppm start= disabled

PAUSE