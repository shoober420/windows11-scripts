rem # Disable AppXSvc
rem # !!! WARNING !!!
rem # Disabling AppXSvc breaks File Explorer features, like zip functionality and right click menu
rem # Causes File Explorer to crash frequently
rem # !!! CAUTION !!!

PAUSE

net stop AppXSvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
