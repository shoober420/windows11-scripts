rem # Enable and start NVIDIA Control Panel

rem # Enable PowerShell

rem # Enable and start WMI (required for powershell)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "0" /f

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

Get-AppxPackage 'NVIDIACorp.NVIDIAControlPanel' | % { Copy-Item -LiteralPath $_.InstallLocation -Destination $Env:USERPROFILE\Desktop -Recurse -Force; Invoke-Item "$Env:USERPROFILE\Desktop\NVIDIACorp.NVIDIAControlPanel_*\nvcplui.exe" }

PAUSE
