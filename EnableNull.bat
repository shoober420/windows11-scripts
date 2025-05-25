rem # Enable Null service

rem # required for Android Debug Bridge (ADB)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "2" /f

net start Null

PAUSE