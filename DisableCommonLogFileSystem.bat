rem # Disable Common Log File System (CLFS)

rem # !!! WARNING !!!

rem # Breaks PowerShell and DISM when disabled

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CLFS" /v "Start" /t REG_DWORD /d "4" /f

PAUSE

