REM Enable Intel Driver & Support Assistant (Intel DSA)
REM Execute EnableWinUpdate.bat recommended

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAService" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAUpdateService" /v "Start" /t REG_DWORD /d "2" /f
net start DSAService
net start DSAUpdateService

PAUSE
