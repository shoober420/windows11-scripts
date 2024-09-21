rem # Disable Microsoft SAM (Security Accounts Manager)
net stop SamSs
reg add "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f

PAUSE