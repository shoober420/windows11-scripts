rem # Disable Windows Firewall (use router firewall instead)
rem # Windows Firewall is bloat

net stop mpssvc
net stop BFE
net stop wtd

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wtd" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
