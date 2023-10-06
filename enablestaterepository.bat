rem Enable State Repository Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "2" /f

net start StateRepository

PAUSE
