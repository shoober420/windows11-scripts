rem # Disable AMD External Events Utility
rem # V3nilla
rem # https://github.com/shoober420/windows11-scripts/issues/14

rem # !!! WARNING !!!

rem # Locks FPS to monitor refresh rate for some games

rem # !!! WARNING !!!

net stop "AMD External Events Utility"

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f

PAUSE