rem # Disable Device Manager Services

rem # "pnputil /enum-devices" shows all services

rem # WAN Miniport (L2TP)
pnputil /disable-device "SWD\MSRRAS\MS_L2TPMINIPORT"

rem # WAN Miniport (IPv6)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIPV6"

rem # Remote Desktop Device Redirector Bus
pnputil /disable-device "ROOT\RDPBUS\0000"

rem # AMD Crash Defender
pnputil /disable-device "ROOT\AMDLOG\0000"

rem # Microsoft GS Wavetable Synth
pnputil /disable-device "SWD\MMDEVAPI\MicrosoftGSWavetableSynth"

rem # WAN Miniport (SSTP)
pnputil /disable-device "SWD\MSRRAS\MS_SSTPMINIPORT"

rem # WAN Miniport (IP)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIP"

rem # WAN Miniport (Network Monitor)
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANBH"

rem # UMBus Root Bus Enumerator
pnputil /disable-device "ROOT\UMBUS\0000"

rem # Microsoft Virtual Drive Enumerator
pnputil /disable-device "ROOT\vdrvroot\0000"

rem # Composite Bus Enumerator
pnputil /disable-device "ROOT\CompositeBus\0000"

rem # WAN Miniport (IKEv2)
pnputil /disable-device "SWD\MSRRAS\MS_AGILEVPNMINIPORT"

rem # Microsoft Hyper-V Virtualization Infrastructure Driver
pnputil /disable-device "ROOT\VID\0000"

rem # WAN Miniport (PPTP)
pnputil /disable-device "SWD\MSRRAS\MS_PPTPMINIPORT"

rem # Microsoft RRAS Root Enumerator
pnputil /disable-device "SWD\MSRRAS\{5e259276-bc7e-40e3-b93b-8f89b5f3abc0}"

rem # WAN Miniport (PPPOE)
pnputil /disable-device "SWD\MSRRAS\MS_PPPOEMINIPORT"

rem # AMD-Windows Support Components
pnputil /disable-device "SWD\DRIVERENUM\AMDWIN&7&3675a230&0"

rem # Intel(R) Graphics Control Panel
pnputil /disable-device "SWD\DRIVERENUM\CUI&4&25ab1049&0"

rem # AMD-OpenCL User Mode Driver
pnputil /disable-device "SWD\DRIVERENUM\AMDOCL&7&3675a230&0"

rem # Intel(R) iCLS Client
pnputil /disable-device "SWD\DRIVERENUM\OEM_ICLS_component&4&1402e39b&0"

rem # Microsoft Radio Device Enumeration Bus
pnputil /disable-device "SWD\RADIO\{3DB5895D-CC28-44B3-AD3D-6F01A782B8D2}"

rem # Intel(R) Graphics Command Center
pnputil /disable-device "SWD\DRIVERENUM\IGCC&4&25ab1049&0"

rem # Intel(R) Management Engine Interface #1
pnputil /disable-device "PCI\VEN_8086&DEV_A13A&SUBSYS_06B71028&REV_31\3&11583659&0&B0"

rem # AMD Streaming Audio Device
pnputil /disable-device "ROOT\AMDSAFD&FUN_01&REV_01\0000"

rem # Microsoft Kernel Debug Network Adapter
pnputil /disable-device "ROOT\KDNIC\0000"

rem # Root Print Queue
pnputil /disable-device "SWD\PRINTENUM\PrintQueues"

rem # Intel(R) Dynamic Application Loader Host Interface
pnputil /disable-device "SWD\DRIVERENUM\OEM_DAL_component&4&1402e39b&0"

rem # Intel(R) Management Engine WMI Provider
pnputil /disable-device "SWD\DRIVERENUM\OEM_WMI_component&4&1402e39b&0"

rem # Intel(R) Power Engine Plug-in
pnputil /disable-device "ACPI\INT33A1\1"

rem # Microsoft Print to PDF
pnputil /disable-device "SWD\PRINTENUM\{8C9B425C-5DD5-4DC1-AFDE-4EDFD21FFDAE}"

PAUSE