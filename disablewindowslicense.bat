rem Disable Windows License Manager Service for activating Windows product key

net stop LicenseManager

reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
