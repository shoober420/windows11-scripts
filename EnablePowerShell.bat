rem # Enable PowerShell
rem # Required to run PowerShell (ps1) scripts since Windows blocks them from running by default

rem # Enable and start WMI (required for powershell)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable AppXSvc (required for powershell)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "2" /f
net start AppXSvc

rem # Powershell requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

ECHO Yes | reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\powershell.exe"

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem # Enable PowerShell scripts
powershell.exe Set-ExecutionPolicy Unrestricted

PAUSE
