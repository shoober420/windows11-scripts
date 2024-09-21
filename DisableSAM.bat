rem # Disable Microsoft SAM (Security Accounts Manager)
rem # May cause black screen after login if disabled
net stop SamSs
reg add "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f

PAUSE