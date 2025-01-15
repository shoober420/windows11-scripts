rem # Internet and security settings (powershell requires WMI service)

rem # Disable all offloading except Checksum Offloading for gaming

rem # TCP Window Auto-Tuning does NOT cause bufferbloat, DONT disable to increase score

rem # https://www.speedguide.net/articles/gaming-tweaks-5812

rem # https://www.speedguide.net/articles/windows-2kxp-registry-tweaks-157/p-1/

rem # https://learn.microsoft.com/en-us/powershell/module/netadapter/?view=windowsserver2025-ps

rem # https://www.ibm.com/docs/en/was/9.0.5?topic=systems-tuning-windows

rem # https://www.cyberdasm.com/publ/volume_2/computer_tips/how_to_reduce_lag_in_bdo/14-1-0-311

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable AppXSvc (required for powershell)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "2" /f
net start AppXSvc

rem # Powershell requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

TIMEOUT /T 5

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal normal
PowerShell.exe Set-NetTCPSetting -SettingName "*" -ScalingHeuristics disabled
PowerShell.exe Set-NetTCPSetting -SettingName "*" -EcnCapability disabled
PowerShell.exe Set-NetTCPSetting -SettingName "*" -Timestamps disabled
PowerShell.exe Set-NetTCPSetting -SettingName "*" -MaxSynRetransmissions 2
PowerShell.exe Set-NetTCPSetting -SettingName "*" -NonSackRttResiliency disable
PowerShell.exe Set-NetTCPSetting -SettingName "*" -InitialRto 1000
PowerShell.exe Set-NetTCPSetting -SettingName "*" -MinRto 300
powershell.exe Set-NetTCPSetting -SettingName "*" -InitialCongestionWindow 10
powershell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
powershell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling enable
powershell.exe Set-NetOffloadGlobalSetting -Chimney disabled
powershell.exe Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled
powershell.exe Set-NetOffloadGlobalSetting -TaskOffload Disabled
powershell.exe Set-NetOffloadGlobalSetting -ScalingHeuristics Disabled
PowerShell.exe Disable-NetAdapterLso -Name "*"
powershell.exe Disable-NetAdapterRsc -Name "*"
powershell.exe Disable-NetAdapterIPsecOffload -Name "*"
powershell.exe Disable-NetAdapterPowerManagement -Name "*"
powershell.exe Disable-NetAdapterQos -Name "*"
powershell.exe Disable-NetAdapterEncapsulatedPacketTaskOffload -Name "*"
powershell.exe Disable-NetAdapterUso -Name "*"
powershell.exe Disable-NetAdapterRdma -Name "*"
powershell.exe Disable-NetAdapterSriov -Name "*"
powershell.exe Disable-NetAdapterVmq -Name "*"
PowerShell.exe Enable-NetAdapterChecksumOffload -Name "*"
powershell.exe Enable-NetAdapterRss -Name "*"
powershell.exe Set-NetIPv4Protocol -MulticastForwarding Disabled 
powershell.exe Set-NetIPv4Protocol -MediaSenseEventLog Disabled

powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_lldp
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_lltdio
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_msclient
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_rspndr
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_server
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_implat
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_pppoe
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_rdma_ndk
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_ndisuio
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_wfplwf_upper
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_wfplwf_lower
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_netbt
powershell.exe Disable-NetAdapterBinding -Name "*" -ComponentID ms_netbios

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB1Protocol $false
ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB2Protocol $false
powershell.exe $DisableLMHosts_Class=Get-WmiObject -list Win32_NetworkAdapterConfiguration
powershell.exe $DisableLMHosts_Class.EnableWINS($false,$false)
powershell.exe Disable-ScheduledTask -TaskName "Microsoft Compatibility Appraiser" -TaskPath "\Microsoft\Windows\Application Experience"

rem # https://learn.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2022-ps
rem # https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps
rem # Disable mitigations to fix stuttering in games
powershell.exe Set-MpPreference -PUAProtection 0
powershell.exe Set-MpPreference -EnableControlledFolderAccess Disabled
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
powershell.exe Set-Processmitigation -System -Disable RequireInfo
powershell.exe Set-Processmitigation -System -Disable StrictHandle
powershell.exe Set-Processmitigation -System -Disable DisableWin32kSystemCalls
powershell.exe Set-Processmitigation -System -Disable DisableExtensionPoints
powershell.exe Set-Processmitigation -System -Disable BlockDynamicCode
powershell.exe Set-Processmitigation -System -Disable AllowThreadsToOptOut
powershell.exe Set-Processmitigation -System -Disable DisableNonSystemFonts
powershell.exe Set-Processmitigation -System -Disable MicrosoftSignedOnly
powershell.exe Set-Processmitigation -System -Disable AllowStoreSignedBinaries
powershell.exe Set-Processmitigation -System -Disable EnforceModuleDependencySigning
powershell.exe Set-Processmitigation -System -Disable BlockRemoteImageLoads
powershell.exe Set-Processmitigation -System -Disable BlockLowLabelImageLoads
powershell.exe Set-Processmitigation -System -Disable PreferSystem32
powershell.exe Set-Processmitigation -System -Disable AuditRemoteImageLoads
powershell.exe Set-Processmitigation -System -Disable AuditLowLabelImageLoads
powershell.exe Set-Processmitigation -System -Disable AuditPreferSystem32
powershell.exe Set-Processmitigation -System -Disable EnableExportAddressFilter
powershell.exe Set-Processmitigation -System -Disable AuditEnableExportAddressFilter
powershell.exe Set-Processmitigation -System -Disable EnableExportAddressFilterPlus
powershell.exe Set-Processmitigation -System -Disable AuditEnableExportAddressFilterPlus
powershell.exe Set-Processmitigation -System -Disable EnableImportAddressFilter
powershell.exe Set-Processmitigation -System -Disable AuditEnableImportAddressFilter
powershell.exe Set-Processmitigation -System -Disable EnableRopStackPivot
powershell.exe Set-Processmitigation -System -Disable AuditEnableRopStackPivot
powershell.exe Set-Processmitigation -System -Disable EnableRopCallerCheck
powershell.exe Set-Processmitigation -System -Disable AuditEnableRopCallerCheck
powershell.exe Set-Processmitigation -System -Disable EnableRopSimExec
powershell.exe Set-Processmitigation -System -Disable AuditEnableRopSimExec
powershell.exe Set-Processmitigation -System -Disable AuditSEHOP
powershell.exe Set-Processmitigation -System -Disable DisallowChildProcessCreation

rem # Disable Memory Compression
PowerShell -Command "Disable-MMAgent -MemoryCompression"

rem # Disable Page Combining
PowerShell -Command "Disable-MMAgent -PageCombining"

rem # Disable Data Execution Prevention (DEP)
rem # Fixes stuttering in games
BCDEDIT /SET {CURRENT} NX ALWAYSOFF
bcdedit /set nx optout
powershell.exe Set-Processmitigation -System -Disable DEP

rem # Disable DMA memory protection and cores isolation
rem # Disable Virtual Secure Mode (VSM)
rem # Disable Hyper-V
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
bcdedit /set hypervisorlaunchtype off

rem # Disable some of the kernel memory mitigations
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

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

rem # Enable DNS over HTTPS (DoH)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
netsh dns set global doh=yes

rem # SG TCP Optimizer program tweaks
rem # https://www.speedguide.net/downloads.php
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global timestamps=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global initialRto=1000
netsh int tcp set global minRto=300
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh interface tcp set heuristics disabled
netsh interface tcp set global ecncapability=disabled

rem # Disable Network throttling
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "0xffffffff" /f

rem # Improve system responsiveness
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f

rem # UDP Receive Segment Coalescing Offload (URO)
netsh int udp set global uro=disabled

netsh winsock set autotuning on
netsh interface tcp set global hystart=disabled
netsh interface tcp set global fastopen=enabled
netsh interface tcp set global fastopenfallback=enabled

rem # TCP Pacing delays traffic, keep disabled
netsh interface tcp set global pacingprofile=off

netsh interface ip set global neighborcachelimit=4096

rem # TCP window scaling (obsolete)
rem netsh interface tcp set heuristics wsh=enabled

netsh interface ip set global taskoffload=disabled
netsh interface ip set global mediasenseeventlog=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled

rem # force window scaling (obsolete)
rem netsh int tcp set heuristics forcews=enabled

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

reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f

netsh int isatap set state disable
netsh int tcp set global ecn=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled 

rem # enable BBR2 Congestion Control Provider
netsh int tcp set supplemental Template=Internet CongestionProvider=bbr2
netsh int tcp set supplemental Template=Datacenter CongestionProvider=bbr2
netsh int tcp set supplemental Template=Compat CongestionProvider=bbr2
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=bbr2
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=bbr2

rem # Disable IPv6
netsh int ipv6 set state disabled
netsh int ipv6 isatap set state disabled
netsh int teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "6to4_State" /t REG_SZ /d "Disabled" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "ISATAP_State" /t REG_SZ /d "Disabled" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Teredo_State" /t REG_SZ /d "Disabled" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d "255" /f

rem # 1 = Disable Domain Name Devolution (DNS AutoCorrect) / 0 = Enabled (Default)
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f

rem # NIC Properties
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaximumReassemblyHeaders" /t REG_DWORD /d "0x0000ffff" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableMediaSenseEventLog" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableRss" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTcpChimneyOffload" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableAddrMaskReply" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableBcastArpReply" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDca" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableHeuristics" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableIPAutoConfigurationLimits" /t REG_DWORD /d "0" /f

rem # NetDMA
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableTCPA" /t REG_DWORD /d "1" /f

rem # TCP autotuning diagnostic tool
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IPEnableRouter" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "QualifyingDestinationThreshold" /t REG_DWORD /d "0xffffffff" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d "1" /f

rem # 1 = windows scaling only / 2 = timestamps only / 3 = both
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpUseRFC1122UrgentPointer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f

rem # Disables MTU Discovery, which auto sets MTU value randomly based on traffic, never enable
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d "255" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableLargeMtu" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UDP\Parameters" /v "EnableUDPFastSend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableDynamicDiscovery" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f

rem # AFD Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "0x00200000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "0x00200000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxActiveTransmitFileCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNICBuffers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableAddressSharing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableDirectAcceptEx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableChainedReceive" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IRPStackSize" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "LargeBufferSize" /t REG_DWORD /d "32768" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MediumBufferSize" /t REG_DWORD /d "12032" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "SmallBufferSize" /t REG_DWORD /d "1024" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "TransmitWorker" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastTransmit" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastCopyTransmit" /t REG_DWORD /d "128" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "StandardAddressLength" /t REG_DWORD /d "1024" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "transmitIoLength" /t REG_DWORD /d "4294967295" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives " /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering " /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MinimumDynamicBacklog" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaximumDynamicBacklog" /t REG_DWORD /d "20000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicBacklogGrowthDelta" /t REG_DWORD /d "10" /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TcpHybridAck" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "CachedLogonsCount" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TcpInitialRTT" /t REG_DWORD /d "1000" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "" /t REG_DWORD /d "0" /f

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

rem # Allow the computer to ignore NetBIOS name release requests except from WINS servers
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netbt\Parameters" /v "NoNameReleaseOnDemand" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f

PAUSE
