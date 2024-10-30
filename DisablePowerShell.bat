rem # Disable PowerShell

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem # Disable Remote PowerShell
powershell.exe Disable-PSRemoting -Force

rem # Disable PowerShell scripts
powershell.exe Set-ExecutionPolicy Restricted

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "1" /f

PAUSE
