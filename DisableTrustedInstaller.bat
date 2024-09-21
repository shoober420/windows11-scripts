rem # Disable Trusted Installer (Windows Modules Installer)
net stop TrustedInstaller
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "4" /f

PAUSE