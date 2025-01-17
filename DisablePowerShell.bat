rem # Disable PowerShell

rem # Disable Remote PowerShell
powershell.exe Disable-PSRemoting -Force

rem # Disable PowerShell scripts
powershell.exe Set-ExecutionPolicy Restricted

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "1" /f

PAUSE
