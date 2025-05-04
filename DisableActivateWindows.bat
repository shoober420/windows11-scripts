rem # Disable Activate Windows services

rem # Activate Windows watermark and taskbar always visible in fullscreen when genuine windows sync is stopped

reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\sppsvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE