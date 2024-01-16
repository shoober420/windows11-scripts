REM Disables maintenance services for adding and removing windows features and various tweaks

REM "Get-WindowsOptionalFeature -Online" shows enabled features

rem TLS 1.2 or lower is required for Windows Update to work, TLS 1.3 not supported yet
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f

rem Telemetry and Diagnostic Data must be enabled for Insider updates
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "3" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "3" /f

rem winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
net start Appinfo

rem Enable and start WMI
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
net start winmgmt

reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "2" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /t REG_DWORD /d "2" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemEventsBroker" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DispBrokerDesktopSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "2" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\InventorySvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DsmSvc" /v "Start" /t REG_DWORD /d "2" /f

net start ClipSVC

net start Themes
net start AppXSvc
net start StateRepository

net start SENS
net start TimeBrokerSvc
net start SystemEventsBroker
net start Schedule
net start DispBrokerDesktopSvc
net start BrokerInfrastructure
net start TokenBroker

net start UsoSvc
net start wisvc
net start wuauserv
net start BITS
net start TrustedInstaller
net start WaaSMedicSvc
net start cryptsvc
net start InventorySvc
net start DoSvc
net start DiagTrack
net start NetSetupSvc
net start DsmSvc

PAUSE
