rem # Disable UPnP Device Host (upnphost)

net stop upnphost
reg add "HKLM\SYSTEM\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f

PAUSE