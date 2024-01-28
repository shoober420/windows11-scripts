rem Enable State Repository Service
REM WARNING: break system configuration settings, like power options

reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /v "Start" /t REG_DWORD /d "2" /f

net start StateRepository

PAUSE
