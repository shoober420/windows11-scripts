rem # Disable Intel Bloat services

net stop cplspcon
net stop cphs
net stop igccservice
net stop igfxCUIService2.0.0.0
net stop LMS
net stop RstMwService
net stop Intel(R) TPM Provisioning Service"
net stop jhi_service
net stop SystemUsageReportSvc_QUEENCREEK
net stop "Intel(R) SUR QC SAM"
net stop ESRV_SVC_QUEENCREEK
net stop USER_ESRV_SVC_QUEENCREEK
net stop esifsvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\cplspcon" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cphs" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\igccservice" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\igfxCUIService2.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LMS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RstMwService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Intel(R) TPM Provisioning Service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\jhi_service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Intel(R) SUR QC SAM" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ESRV_SVC_QUEENCREEK" /t REG_DWORD /d "4" /f
sc config ESRV_SVC_QUEENCREEK start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USER_ESRV_SVC_QUEENCREEK" /t REG_DWORD /d "4" /f

rem # Intel Dynamic Platform and Thermal Framework (DPTF)
rem # Power Throttling and Thermal Management
reg add "HKLM\SYSTEM\CurrentControlSet\Services\esifsvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE