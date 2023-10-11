rem Enable Windows License Manager Service for activating Windows product key

reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "2" /f

net start LicenseManager

PAUSE
