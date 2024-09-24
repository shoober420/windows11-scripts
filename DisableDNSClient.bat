rem # Disable DNS Client (Dnscache)
rem # !!! WARNING !!!
rem # Disabling DNS Client borks internet
rem # !!! CAUTION !!!

PAUSE

net stop Dnscache

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "4" /f

PAUSE