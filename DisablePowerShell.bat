rem # Disable PowerShell

rem # Disable Remote PowerShell
powershell.exe Disable-PSRemoting -Force

rem # Disable PowerShell scripts
powershell.exe Set-ExecutionPolicy Restricted

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root


rem # Disable PowerShell script execution
rem # https://teamt5.org/en/posts/a-deep-dive-into-powershell-s-constrained-language-mode
rem # https://www.thewindowsclub.com/how-to-disable-powershell-windows-10

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f
reg add "HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f
reg add "HKLM\Software\Microsoft\PowerShell\1\ShellIds\ScriptedDiagnostics" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\PowerShell\1\ShellIds\ScriptedDiagnostics" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f

reg add "HKLM\Software\Policies\Microsoft\PowerShellCore" /v "EnableScripts" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell" /v "EnableScripts" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\PowerShellCore" /v "EnableScripts" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\PowerShell" /v "EnableScripts" /t REG_DWORD /d "0" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "1" /f

PAUSE
