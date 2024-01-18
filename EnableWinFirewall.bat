REM Enable Windows Firewall

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wtd" /v "Start" /t REG_DWORD /d "2" /f

net start mpssvc
net start BFE
net start wtd

PAUSE
