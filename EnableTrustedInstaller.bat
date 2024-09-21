rem # Enable Trusted Installer (Windows Modules Installer)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f
net start TrustedInstaller

PAUSE