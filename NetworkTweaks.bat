rem # Network Tweaks

rem # RECOMMENDED TO RUN DNS.bat and DNS.ps1 FOR OPTIMAL DNS SETTINGS

PAUSE

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530

if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

TIMEOUT 5

rem # Go to Control Panel > Network and Sharing Center for network name

rem # Receive Side Scaling requires Checksum Offloading to be enabled to work, disable all other offloading options for best latency

rem # Enables Cloudflare DNS

netsh interface ip set dns Wi-Fi static 1.1.1.1
netsh interface ip set dns Ethernet static 1.1.1.1

rem # Enable DNS over HTTPS (DoH)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDoh" /t REG_DWORD /d "2" /f
rem netsh dns set global doh=force

rem # Make sure "subinterface" matches network name
rem # Find correct MTU value and set below
rem # open Command Prompt
rem # ping www.google.com -f -l 1500 (keep lowering value until packets aren't fragmented)

rem netsh interface ipv4 set subinterface "Wi-Fi" mtu=1472 store=persistent

rem netsh interface ipv4 set subinterface "Ethernet" mtu=1472 store=persistent

rem # Set value according to core amount
rem # 4 cores = 4 Queues / 8+ = 8 Queues
rem # 8+ Queues may cause loss of connection
rem # 8+ Queues may cause laggy internet

rem # Test by running https://www.waveform.com/tools/bufferbloat

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d "4" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d "4" /f

rem # Intel P-Cores are 2 threads per core with Hyper-Threading enabled

rem # With Intel Hyper-Threading disabled, P-Cores have 1 thread per core

rem # Intel E-Cores always have 1 thread per core

rem # Intel Hyper-Threading enabled will increase latency

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/wmic-thread-count-command.30192/post-521969

rem # for /f "tokens=2 delims=^=" %%t in ('wmic cpu get NumberOfLogicalProcessors /value ^| find "="') do set Threads=%%t

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "MaxNumRssThreads" /t REG_DWORD /d "%Threads%" /f       
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxNumRssThreads" /t REG_DWORD /d "%Threads%" /f

rem # https://stackoverflow.com/users/6738015/compo
rem # https://stackoverflow.com/questions/79154160/cpu-thread-count-query-with-wmic-for-registry-key

@For /F "Tokens=2 Delims==" %%G In ('%SystemRoot%\System32\wbem\WMIC.exe CPU Get NumberOfLogicalProcessors /Value 2^>NUL ^| %SystemRoot%\System32\find.exe "="') Do @For /F %%H In ("%%G") Do @For %%I In (Ndis Tcpip) Do @%SystemRoot%\System32\reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\%%I\Parameters" /V "MaxNumRssThreads" /T REG_DWORD /D %%H /F 1>NUL

rem # Set RssBaseCpu to last Core on CPU
@For /F "Tokens=2 Delims==" %%G In ('%SystemRoot%\System32\wbem\WMIC.exe CPU Get NumberOfCores /Value 2^>NUL ^| %SystemRoot%\System32\find.exe "="') Do @For /F %%H In ("%%G") Do @For %%I In (Ndis Tcpip) Do @%SystemRoot%\System32\reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\%%I\Parameters" /V "RssBaseCpu" /T REG_DWORD /D %%H /F 1>NUL

rem # Enable DNS over HTTPS
rem # "wmic nic" to find NIC ID
rem # HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{NIC ID}\DohInterfaceSettings\Doh\1.1.1.1

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{86ce1c79-20b9-4314-9c3f-356bccdd8a62}\DohInterfaceSettings\Doh\1.1.1.1" /v "DohFlags" /t REG_QWORD /d "0x00000011" /f

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{86ce1c79-20b9-4314-9c3f-356bccdd8a62}\DohInterfaceSettings\Doh\1.1.1.1" /v "DohTemplate" /t REG_SZ /d "https://cloudfare-dns.com/dns-query" /f


rem # Affinity tweak
rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/wmic-query-cpu-core-count-to-execute-setting.30155/post-521450

for /f "tokens=2 delims=^=" %%f in ('wmic cpu get NumberOfCores /value ^| find "="') do set Cores=%%f

if %Cores% gtr 4 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "5" /f
)

rem # NIC Tweaks

rem # Last key changes based on NIC card registry ID

rem # Find "Class Guid" under Device Manager > Network adapters > Properties > Details tab

rem # Go to "HKLM\SYSTEM\CurrentControlSet\Control\Network\"Class Guid"\<NIC ID>\Connection" to get NIC ID

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "TcpNoDelay" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces\Tcpip_{1B2AF3AC-865B-4B81-BFFA-790A51C634A6}" /v "NetbiosOptions" /t REG_DWORD /d "2" /f

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/find-nic-class-guid-in-batch-script-using-wmic-or-anything-else.30083/

for /f "delims=" %%n in ('wmic nic where "GUID is not null" get guid ^| findstr /v GUID') do (
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v "TcpNoDelay" /t REG_DWORD /d "1" /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%n" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
   reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces\Tcpip_%%n" /v "NetbiosOptions" /t REG_DWORD /d "2" /f
)

rem # find value for 000X at HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\<NIC ID>\DriverDesc key

rem # NIC parameters are at HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\<NIC ID>\Ndi\Params



rem # Get the Sub ID of the Network Adapter

for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (

rem # Set value according to core amount
rem # 4 cores = 4 Queues / 8+ = 8 Queues
rem # 8+ Queues may cause loss of connection
rem # 8+ Queues may cause laggy internet

rem # Test by running https://www.waveform.com/tools/bufferbloat

reg add "%%n" /v "*NumRssQueues" /t REG_SZ /d "4" /f

rem # Speed & Duplex must be set to "Auto Negotiation" or internet borks unless you know correct value

reg add "%%n" /v "*SpeedDuplex" /t REG_SZ /d "0" /f

rem # MIMO Power Save Mode - 3 Disable
reg add "%%n" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f

reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
reg add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PacketCoalescing" /t REG_SZ /d "0" /f
reg add "%%n" /v "ThroughputBoosterEnabled" /t REG_SZ /d "1" /f
reg add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f
reg add "%%n" /v "*MiracastSupported" /t REG_DWORD /d "0" /f
reg add "%%n" /v "*DeviceSleepOnDisconnect" /t REG_DWORD /d "0" /f
reg add "%%n" /v "RoamAggressiveness" /t REG_SZ /d "0" /f
reg add "%%n" /v "RoamingPreferredBandType" /t REG_SZ /d "3" /f
reg add "%%n" /v "uAPSDSupport" /t REG_SZ /d "0" /f
reg add "%%n" /v "RecommendedBeaconInterval" /t REG_DWORD /d "99999999" /f
reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "0" /f
reg add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RSS" /t REG_SZ /d "1" /f
reg add "%%n" /v "*TCPConnectionOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPConnectionOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*IPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "%%n" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "%%n" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "3" /f
reg add "%%n" /v "*UDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "%%n" /v "*UDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f
reg add "%%n" /v "*LsoV1IPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*LsoV2IPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*LsoV2IPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TCPUDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f
reg add "%%n" /v "*TCPUDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f

reg add "%%n" /v "*PMARPOffload" /t REG_SZ /d "0" /f
reg add "%%n" /v "Downshift" /t REG_SZ /d "0" /f
reg add "%%n" /v "*EEE" /t REG_SZ /d "0" /f

rem # JumboPacket: 1514 = Disabled
reg add "%%n" /v "*JumboPacket" /t REG_SZ /d "1514" /f

reg add "%%n" /v "LogLinkStateEvent" /t REG_SZ /d "0" /f
reg add "%%n" /v "*QoS" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "%%n" /v "*ReceiveBuffers" /t REG_SZ /d "4096" /f
reg add "%%n" /v "*RscIPv4" /t REG_SZ /d "0" /f
reg add "%%n" /v "*RscIPv6" /t REG_SZ /d "0" /f
reg add "%%n" /v "*TransmitBuffers" /t REG_SZ /d "8184" /f
reg add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeOnPing" /t REG_SZ /d "0" /f
reg add "%%n" /v "WakeFromPowerOff" /t REG_SZ /d "0" /f
reg add "%%n" /v "*PMNSOffload" /t REG_SZ /d "0" /f

reg add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f
reg add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f

rem # Interrupt Moderation Rate: Interrupt Throttling Rate (ITR)
reg add "%%n" /v "ITR" /t REG_SZ /d "0" /f

rem # Disable Power Management options
reg add "%%n" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f
)

rem # MSI mode support for NIC
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)



rem # Launch DNS.bat and DNS.ps1 for optimal DNS settings
cd "%~dp0"
call DNS.bat
cd "%~dp0"
ECHO R | powershell.exe ./DNS.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
call DNS.bat
cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./DNS.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
call DNS.bat
cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./DNS.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
call DNS.bat
cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./DNS.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
call DNS.bat
cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./DNS.ps1
cd "%USERPROFILE%\Downloads"

rem # RECOMMENDED TO RUN DNS.bat and DNS.ps1 FOR OPTIMAL DNS SETTINGS

PAUSE
