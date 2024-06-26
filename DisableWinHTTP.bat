rem # Disable WinHttpAutoProxySvc
rem # !!! WARNING !!!
rem # Breaks internet when disabled
rem # !!! CAUTION !!!
rem # DO NOT USE 
rem # FOR TESTING PURPOSES ONLY

PAUSE

net stop WinHttpAutoProxySvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
