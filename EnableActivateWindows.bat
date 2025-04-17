rem # Enable Activate Windows services

rem # Used to remove Activate Windows watermark when sync with Windows servers is absent for too long

rem # REBOOT REQUIRED

rem # It takes a couple minutes after reboot for the activation sync to occur and Windows being activated again

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\sppsvc" /v "Start" /t REG_DWORD /d "2" /f

PAUSE