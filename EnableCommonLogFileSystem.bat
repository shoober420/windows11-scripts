rem # Enable Common Log File System (CLFS)

rem # !!! WARNING !!!

rem # Breaks PowerShell and DISM when disabled

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\CLFS" /v "Start" /t REG_DWORD /d "2" /f

PAUSE