rem # Enable COM+ Event System (EventSystem)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "2" /f

net start EventSystem

PAUSE