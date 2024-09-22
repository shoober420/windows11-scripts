rem # Enable UAC
rem # requires reboot

PAUSE

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f

PAUSE
