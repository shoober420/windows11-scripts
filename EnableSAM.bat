rem # Enable Microsoft SAM (Security Accounts Manager)
reg add "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "2" /f
net start SamSs

PAUSE