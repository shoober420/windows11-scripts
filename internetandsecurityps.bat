rem Internet and security settings (powershell requires WMI service)

rem Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

TIMEOUT /T 5

PowerShell.exe Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal normal
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -EcnCapability disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -Timestamps disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTCPSetting -SettingName internet -NonSackRttResiliency disable
PowerShell.exe Set-NetTCPSetting -SettingName internet -InitialRto 2000
PowerShell.exe Set-NetTCPSetting -SettingName internet -MinRto 300
powershell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
powershell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling enable
powershell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Enable-NetAdapterChecksumOffload -Name *
powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB1Protocol $false
ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB2Protocol $false
powershell.exe $DisableLMHosts_Class=Get-WmiObject -list Win32_NetworkAdapterConfiguration
powershell.exe $DisableLMHosts_Class.EnableWINS($false,$false)
powershell.exe Disable-ScheduledTask -TaskName "Microsoft Compatibility Appraiser" -TaskPath "\Microsoft\Windows\Application Experience"
powershell.exe Set-MpPreference -PUAProtection 0
powershell.exe Set-MpPreference -EnableControlledFolderAccess Disabled
powershell.exe Set-Processmitigation -System -Disable DEP
powershell.exe Set-Processmitigation -System -Disable StrictCFG
powershell.exe Set-Processmitigation -System -Disable CFG
powershell.exe Set-Processmitigation -System -Disable SuppressExports
powershell.exe Set-Processmitigation -System -Disable EmulateAtlThunks
powershell.exe Set-Processmitigation -System -Disable ForceRelocateImages
powershell.exe Set-Processmitigation -System -Disable BottomUp
powershell.exe Set-Processmitigation -System -Disable HighEntropy
powershell.exe Set-Processmitigation -System -Disable SEHOP
powershell.exe Set-Processmitigation -System -Disable SEHOPTelemetry
powershell.exe Set-Processmitigation -System -Disable TerminateOnError
powershell.exe Set-Processmitigation -System -Disable DynamicCode
powershell.exe Set-Processmitigation -System -Disable AuditDynamicCode
powershell.exe Set-Processmitigation -System -Disable AuditImageLoad
powershell.exe Set-Processmitigation -System -Disable AuditFont
powershell.exe Set-Processmitigation -System -Disable FontAuditOnly
powershell.exe Set-Processmitigation -System -Disable AuditMicrosoftSigned
powershell.exe Set-Processmitigation -System -Disable AuditStoreSigned
powershell.exe Set-Processmitigation -System -Disable AuditSystemCall
powershell.exe Set-Processmitigation -System -Disable AuditChildProcess

rem Disable and stop WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f
sc config winmgmt start= disabled
net stop winmgmt

PAUSE
