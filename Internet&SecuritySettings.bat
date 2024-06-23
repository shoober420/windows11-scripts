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

ECHO Y | powershell.exe Set-SmbClientConfiguration -EnableSMBQUIC $false
ECHO Y | powershell.exe Set-SmbClientConfiguration -AuditServerDoesNotSupportEncryption $true
ECHO Y | powershell.exe Set-SmbClientConfiguration -AuditServerDoesNotSupportSigning $true
ECHO Y | powershell.exe Set-SmbServerConfiguration -AuditClientDoesNotSupportEncryption $true
ECHO Y | powershell.exe Set-SmbServerConfiguration -AuditClientDoesNotSupportSigning $true

rem # Blocking all inbound connections can break certain Wi-Fi and Ethernet connections
rem # Using "Block all connections" instead of "Block" option under firewall fixes loss of internet for some WiFi cards
netsh advfirewall set domainprofile firewallpolicy blockinboundalways,allowoutbound
netsh advfirewall set publicprofile firewallpolicy blockinboundalways,allowoutbound
netsh advfirewall set privateprofile firewallpolicy blockinboundalways,allowoutbound
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
netsh advfirewall firewall set rule group="remote desktop" new enable=No
netsh advfirewall set allprofiles settings unicastresponsetomulticast disable

rem # Deleting all inbound firewall rules may break internet for certain Wi-Fi cards
powershell.exe Remove-NetFirewallRule -All

rem # SG TCP Optimizer program tweaks
rem # https://www.speedguide.net/downloads.php
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global timestamps=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global initialRto=2000
netsh int tcp set global minRto=300
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface tcp set heuristics disabled
netsh interface tcp set global ecncapability=disabled
netsh int udp set global uro=enabled
netsh winsock set autotuning on
netsh interface tcp set global hystart=disabled
netsh interface tcp set global fastopen=enabled
netsh interface tcp set global fastopenfallback=enabled 
netsh interface tcp set global pacingprofile=slowstart
netsh interface ip set global neighborcachelimit=4096
netsh interface tcp set heuristics wsh=disabled
netsh interface ip set global taskoffload=enabled
netsh interface ip set global mediasenseeventlog=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int tcp set heuristics forcews=disabled
netsh int ipv4 set dynamicport tcp start=1025 num=65411
netsh int ipv4 set dynamicport udp start=1025 num=65411
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TcpCreateAndConnectTcbRateLimitDepth" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IGMPLevel" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d "2" /f

rem # NIC Properties
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaximumReassemblyHeaders" /t REG_DWORD /d "0x0000ffff" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableMediaSenseEventLog" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableRss" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTcpChimneyOffload" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableAddrMaskReply" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableBcastArpReply" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDca" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableHeuristics" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableIPAutoConfigurationLimits" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableTCPA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IPEnableRouter" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "QualifyingDestinationThreshold" /t REG_DWORD /d "0xffffffff" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpUseRFC1122UrgentPointe" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f

rem # Disable Unicast
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\WindowsFirewall\StandardProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PrivateProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "DisableUnicastResponsesToMulticastBroadcast" /t REG_DWORD /d "1" /f

rem # Disable SSL2.0 and SSL3.0
rem # Disable TLS1.0, TLS1.1, and TLS1.2
rem # Disable DTLS1.0, DTLS1.1, and DTLS1.2
rem # Force Enable TLS1.3 and DTLS1.3
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.1\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.1\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.1\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.1\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Client" /v "Enabled" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.3\Client" /v "Enabled" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.3\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.3\Server" /v "Enabled" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.3\Server" /v "DisabledByDefault" /t REG_DWORD /d "1" /f

rem Disable and stop WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f
sc config winmgmt start= disabled
net stop winmgmt

rem # Breaks internet if 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "DisableWpad" /t REG_DWORD /d "0" /f

PAUSE
