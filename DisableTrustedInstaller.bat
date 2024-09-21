rem # Disable Trusted Installer (Windows Modules Installer)
rem # requires SAFE MODE
rem # requires SetACL.bat script to be run first

PAUSE

net stop TrustedInstaller
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "4" /f

PAUSE