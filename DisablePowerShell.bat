rem # Disable PowerShell

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem # Disable and stop WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f
sc config winmgmt start= disabled
net stop winmgmt

PAUSE