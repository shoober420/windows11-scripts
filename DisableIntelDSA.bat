REM Disable Intel Driver & Support Assistant (Intel DSA)
REM Execute DisableWinUpdate.bat recommended

net stop TrustedInstaller
net stop Appinfo
net stop Winmgmt
net stop DSAService
net stop DSAUpdateService
net stop SystemUsageReportSvc_QUEENCREEK
net stop "Intel(R) SUR QC SAM"

reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAUpdateService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Intel(R) SUR QC SAM" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
