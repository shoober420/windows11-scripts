rem # Disable Workstation (LanmanWorkstation)

net stop LanmanWorkstation
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "4" /f

PAUSE