rem # Disable Null service

rem # !!! WARNING !!!

rem # REQUIRED FOR:

rem # Discord
rem # Android Debug Bridge (ADB)

rem # !!! WARNING !!!

PAUSE

net stop Null

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "4" /f

PAUSE