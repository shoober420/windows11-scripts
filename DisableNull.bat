rem # Disable Null service

rem # required for Android Debug Bridge (ADB)

net stop Null

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "4" /f

PAUSE