rem !!! WARNING !!!
rem !!! THE FOLLOWING SETTINGS REQUIRE ADJUSTING BEFORE BEING EXECUTED !!!

PAUSE

rem # Go to Control Panel > Network and Sharing Center for network name

rem # Make sure "name=" matches network name, half of internet breaks unless DNS is specified
rem # Enables Cloudflare DNS
netsh interface ip set dns name="Wi-Fi" static 1.1.1.1
rem netsh interface ip add dns name="Wi-Fi" 1.0.0.1 index=2
netsh interface ip set dns name="Ethernet" static 1.1.1.1
rem netsh interface ip add dns name="Ethernet" 1.0.0.1 index=2

rem # Make sure "subinterface" matches network name
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1472 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1472 store=persistent

rem # FastSendDatagramThreshold should match MTU value in decimal, not hexadecimal (usually 1472)
rem # https://docs.oracle.com/cd/E13924_01/coh.340/e13818/perftune.htm
rem # As opposed to NVIDIA saying to use a value of 64K
rem # https://docs.nvidia.com/networking/display/winofv55054000/general+performance+optimization+and+tuning
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "0x000005c0" /f

rem # Set values according to core and thread count
rem # 8+ Queues may cause laggy internet, test by running RemoveWindowsApps.bat and
rem # https://www.waveform.com/tools/bufferbloat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d "4" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d "4" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "MaxNumRssThreads" /t REG_DWORD /d "32" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxNumRssThreads" /t REG_DWORD /d "32" /f

rem # Set to last Core on CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "RssBaseCpu" /t REG_DWORD /d "8" /f

rem # Enable DNS over HTTPS
rem # "wmic nic" to find NIC ID
rem # HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{NIC ID}\DohInterfaceSettings\Doh\1.1.1.1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{86ce1c79-20b9-4314-9c3f-356bccdd8a62}\DohInterfaceSettings\Doh\1.1.1.1" /v "DohFlags" /t REG_QWORD /d "0x00000011" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{86ce1c79-20b9-4314-9c3f-356bccdd8a62}\DohInterfaceSettings\Doh\1.1.1.1" /v "DohTemplate" /t REG_SZ /d "https://cloudfare-dns.com/dns-query" /f

rem # NIC Tweaks

rem # Last key changes based on NIC card registry ID
rem # Find "Class Guid" under Device Manager > Network adapters > Properties > Details tab
rem # Go to "HKLM\SYSTEM\CurrentControlSet\Control\Network\"Class Guid"\<NIC ID>\Connection" to get NIC ID

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpNoDelay" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces\Tcpip_{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "NetbiosOptions" /t REG_DWORD /d "2" /f

rem # find value for 000X at HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\<NIC ID>\DriverDesc key

rem # NIC parameters are at HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\<NIC ID>\Ndi\Params

rem # Set to how many cores your CPU has
rem # 8+ Queues may cause laggy internet, test by running RemoveWindowsApps.bat and
rem # https://www.waveform.com/tools/bufferbloat
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*NumRssQueues" /t REG_SZ /d "4" /f

rem # MIMO Power Save Mode - 3 Disable
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*PacketCoalescing" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "ThroughputBoosterEnabled" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*MiracastSupported" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*DeviceSleepOnDisconnect" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RoamAggressiveness" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RoamingPreferredBandType" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "uAPSDSupport" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RecommendedBeaconInterval" /t REG_DWORD /d "99999999" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*InterruptModeration" /t REG_SZ /d "0" /f


rem # Speed & Duplex must be set to "Auto Negotiation" or internet borks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*SpeedDuplex" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*FlowControl" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*RSS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPConnectionOffloadIPv4" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPConnectionOffloadIPv6" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*IPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*UDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*UDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*LsoV1IPv4" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*LsoV2IPv4" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*LsoV2IPv6" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPUDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TCPUDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*PMARPOffload" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "Downshift" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*EEE" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*JumboPacket" /t REG_SZ /d "1472" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "LogLinkStateEvent" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*QoS" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*ReceiveBuffers" /t REG_SZ /d "4096" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*RscIPv4" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*RscIPv6" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*TransmitBuffers" /t REG_SZ /d "8184" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "WakeOnLink" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "WakeOnPing" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "WakeFromPowerOff" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "*PMNSOffload" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "TxIntDelay" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RxIntDelay" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "FlowControlCap" /t REG_SZ /d "0" /f

rem # Interrupt Moderation Rate: Interrupt Throttling Rate (ITR)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "ITR" /t REG_SZ /d "0" /f

rem 3 - Require DoH / 2 - Allow DoH / 1 - Prohibit DoH
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DoHPolicy" /t REG_DWORD /d "3" /f

PAUSE
