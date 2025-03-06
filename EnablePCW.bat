rem # Enable Performance Counters for Windows (PCW)

rem # !!! WARNING !!!

rem # Minimal Setup ONLY
rem # Breaks Task Manager when disabled

rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\pcw" /v "Start" /t REG_DWORD /d "0" /f
net start pcw

PAUSE