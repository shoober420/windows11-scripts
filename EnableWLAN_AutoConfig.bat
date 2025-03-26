rem # Enable WLAN AutoConfig

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "3" /f

net start WlanSvc

PAUSE