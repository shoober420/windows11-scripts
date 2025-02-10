rem # Disable State Repository Service

rem # !!! WARNING !!!
rem # Breaks system configuration settings, like power options

rem # Breaks GUI, like taskbar, icons, and background
rem # !!! WARNING !!!

rem # FOR TESTING PURPOSES ONLY

PAUSE

rem net stop StateRepository

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
