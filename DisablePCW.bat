rem # Disable Performance Counters for Windows (PCW)

rem # !!! WARNING !!!

rem # Minimal Setup ONLY
rem # Breaks Task Manager

rem # !!! WARNING !!!

PAUSE

net stop pcw
reg add "HKLM\SYSTEM\CurrentControlSet\Services\pcw" /v "Start" /t REG_DWORD /d "4" /f

PAUSE