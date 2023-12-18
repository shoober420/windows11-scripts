REM Enable Intel Driver & Support Assistant (Intel DSA)
REM Execute EnableWinUpdate.bat recommended

reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAService" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DSAUpdateService" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Intel(R) SUR QC SAM" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ESRV_SVC_QUEENCREEK" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USER_ESRV_SVC_QUEENCREEK" /t REG_DWORD /d "2" /f

net start TrustedInstaller
net start Appinfo
net start Winmgmt
net start DSAService
net start DSAUpdateService
net start SystemUsageReportSvc_QUEENCREEK
net start "Intel(R) SUR QC SAM"
net start ESRV_SVC_QUEENCREEK
net start USER_ESRV_SVC_QUEENCREEK

PAUSE
