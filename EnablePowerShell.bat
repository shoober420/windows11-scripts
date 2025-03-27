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

rem # Disable PowerShell script execution
rem https://teamt5.org/en/posts/a-deep-dive-into-powershell-s-constrained-language-mode
rem https://www.thewindowsclub.com/how-to-disable-powershell-windows-10
reg add "HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
reg add "HKLM\Software\Microsoft\PowerShell\1\ShellIds\ScriptedDiagnostics" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\PowerShell\1\ShellIds\ScriptedDiagnostics" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
reg add "HKLM\Software\Policies\Microsoft\PowerShellCore" /v "EnableScripts" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell" /v "EnableScripts" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\PowerShellCore" /v "EnableScripts" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\PowerShell" /v "EnableScripts" /t REG_DWORD /d "1" /f

rem # Enable PowerShell scripts
powershell.exe Set-ExecutionPolicy Unrestricted



PAUSE