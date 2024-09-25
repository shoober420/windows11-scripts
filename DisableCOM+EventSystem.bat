rem # Disable COM+ Event System (EventSystem)

net stop EventSystem

reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "4" /f

PAUSE