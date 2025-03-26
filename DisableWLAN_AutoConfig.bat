rem # Disable WLAN AutoConfig

rem # !!! WARNING !!!

rem # MAY BREAK WIFI

rem # !!! WARNING !!!

PAUSE

net stop WlanSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE