rem # Disable PDC (Primary Domain Controller)

rem # Manages security and user authentication for a Windows server's local domain

rem # !!! WARNING !!!

rem # causes sihost.exe error at sign in screen
rem # breaks theme settings

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

net stop pdc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\pdc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE