rem # Disable and remove Windows features

rem # Windows update services required for DISM

rem # "DISM /online /get-features /format:table" shows installed features

rem # "Get-WindowsOptionalFeature -Online" shows installed features

rem # Possible AUTO-REBOOT if ran without admin privileges

rem # REBOOT RECOMMENDED

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\InventorySvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f

net start UsoSvc
net start wisvc
net start wuauserv
net start BITS
net start TrustedInstaller
net start WaaSMedicSvc
net start cryptsvc
net start InventorySvc
net start DoSvc
net start DiagTrack
net start Appinfo
net start Winmgmt

rem Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable PowerShell

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem # TLS 1.2 or lower is required for Windows Update to work, TLS 1.3 not supported yet

reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f

DISM /Online /Disable-Feature /FeatureName:MediaPlayback /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSRDC-Infrastructure /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-Foundation-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-XPSServices-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SMB1Protocol /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SearchEngine-Client-Package /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-TCP-PortSharing45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Windows-Defender-Default-Definitions /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WorkFolders-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:NetFx3 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:LegacyComponents /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:DirectPlay /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-All /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-HyperV-All /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-HyperV /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Client-ProjFS /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TelnetClient /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TFTP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TIFFIFilter /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:NetFx4-AdvSrvs /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-Services45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SimpleTCP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-RemoteDesktopConnection /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:DirectoryServices-ADAM-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SmbDirect /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSRDC-Infrastructure /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Recall /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SNMP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WMISnmpProvider /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Windows-Identity-Foundation /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:DirectoryServices-ADAM-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WebServerRole /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WebServer /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-CommonHttpFeatures /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpErrors /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpRedirect /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ApplicationDevelopment /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-NetFxExtensibility /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-NetFxExtensibility45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HealthAndDiagnostics /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpLogging /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-LoggingLibraries /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-RequestMonitor /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpTracing  /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-Security /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-URLAuthorization /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-RequestFiltering /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-IPSecurity /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-Performance /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpCompressionDynamic /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WebServerManagementTools /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ManagementScriptingTools /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-IIS6ManagementCompatibility /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-Metabase /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WAS-WindowsActivationService /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WAS-ProcessModel /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WAS-ConfigurationAPI /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HostableWebCore /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-CertProvider /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WindowsAuthentication /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-DigestAuthentication /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ClientCertificateMappingAuthentication /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-IISCertificateMappingAuthentication /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ODBCLogging /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-StaticContent /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-DefaultDocument /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-DirectoryBrowsing /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WebDAV /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WebSockets /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ApplicationInit /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ASPNET /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ASPNET45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ASP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-CGI /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ISAPIExtensions /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ISAPIFilter /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ServerSideIncludes /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-CustomLogging /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-BasicAuthentication /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-HttpCompressionStatic /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ManagementConsole /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-ManagementService /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-WMICompatibility /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-LegacyScripts /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-LegacySnapIn /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-FTPServer /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-FTPSvc /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:IIS-FTPExtensibility /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-Container /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-Server /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-Triggers /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-ADIntegration /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-HTTP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-Multicast /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSMQ-DCOMProxy /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-HTTP-Activation45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-TCP-Activation45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-Pipe-Activation45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-MSMQ-Activation45 /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-HTTP-Activation /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WCF-NonHTTP-Activation /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Windows-MobilePC-Client-Premium-Package-net /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-XPSServices-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:RasCMAK /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:RasRip /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MSRDC-Infrastructure /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TelnetClient /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TelnetServer /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TFTP /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:TIFFIFilter /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:WorkFolders-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SMB1Protocol /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Server /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SMB2Protocol /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-All /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-Tools-All /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-Management-Clients /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-Management-PowerShell /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:MFaxServicesClientPackage /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:LegacyComponents /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-Foundation-Features /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client /Remove /NoRestart

DISM /Online /Disable-Feature /FeatureName:SmbDirect /Remove /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Components-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-CodeIntegrity-Diagnostics-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HypervisorEnforcedCodeIntegrity-Sysprep-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HypervisorEnforcedCodeIntegrity-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-OneCore-VirtualizationBasedSecurity-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-DeviceGuard-GPEXT-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Nis-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Management-Powershell-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Management-MDM-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Management-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Group-Policy-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Core-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Client-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-WOW64-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-AppLayer-Group-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-AM-Default-Definitions-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-AM-Default-Definitions-OptionalWrapper-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-Group-Policy-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Components-WOW64-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HVSI-WOW64-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-SecurityCenter /NoRestart

DISM /Online /Remove-Package /PackageName:Multimedia-RestrictedCodecsDolby /NoRestart

DISM /Online /Remove-Package /PackageName:RemoteDesktopServices-Base-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-SMB /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Smb /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Telnet-Client-Opt /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Telnet-Client-FOD-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-TFTP-Client-FOD-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-WMPNetworkSharingService /NoRestart

DISM /Online /Remove-Package /PackageName:OpenSSH-Client /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Internet-Browser-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-MicrosoftEdgeDevToolsClient-Package /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Hyper-V-All /NoRestart

DISM /Online /Remove-Package /PackageName:Client-ProjFS /NoRestart

DISM /Online /Remove-Package /PackageName:TelnetClient /NoRestart

DISM /Online /Remove-Package /PackageName:TFTP /NoRestart

DISM /Online /Remove-Package /PackageName:TIFFIFilter /NoRestart

DISM /Online /Remove-Package /PackageName:NetFx4-AdvSrvs /NoRestart

DISM /Online /Remove-Package /PackageName:WCF-Services45 /NoRestart

DISM /Online /Remove-Package /PackageName:VirtualMachinePlatform /NoRestart

DISM /Online /Remove-Package /PackageName:HypervisorPlatform /NoRestart

DISM /Online /Remove-Package /PackageName:Containers /NoRestart

DISM /Online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard /NoRestart

DISM /Online /Remove-Package /PackageName:Containers-DisposableClientVM /NoRestart

powershell Remove-WindowsCapability -Name Realtek -Online

powershell Remove-WindowsCapability -Name Vmware -Online

powershell Remove-WindowsCapability -Name InternetExplorer -Online

powershell Remove-WindowsCapability -Name StepsRecorder -Online

powershell Remove-WindowsCapability -Name WindowsMediaPlayer -Online

powershell Remove-WindowsCapability -Name Wallpapers -Online

powershell Remove-WindowsCapability -Name Print -Online

powershell Remove-WindowsCapability -Name MathRecognizer -Online

powershell Remove-WindowsCapability -Name OpenSSH -Online

powershell Remove-WindowsCapability -Name QuickAssist -Online

powershell Remove-WindowsCapability -Name OneSync -Online

powershell Remove-WindowsCapability -Name LA57 -Online

powershell Remove-WindowsCapability -Name Virtual -Online

powershell Remove-WindowsCapability -Name Hello -Online

DISM /Online /Remove-Package /PackageName:Microsoft-WindowsCore-Network-FlowSteering /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-TFTP-Client-Opt /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-OfflineFile /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-NFS /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-NetworkDiagnostics /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Telnet /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-PeerDist /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-MultiPoint /NoRestart

DISM /Online /Remove-Package /PackageName:MultiPoint /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-ClientForNFS-Infrastructure-OptGroup /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-TFTP-Client /NoRestart

DISM /Online /Disable-Feature /FeatureName:HyperV /Remove /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-ApiSetSchemaExtension-HyperV /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HyperV-OptionalFeature /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-OneCore-UtilityVm /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-OneCore-Containers /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-OneCore-UtilityVM-Containers /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-UtilityVM-Containers /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-OneCore-Containers /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Lxss /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-ConfigCI /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-hyper-v-all /NoRestart

DISM /Online /Remove-Package /PackageName:LanguageFeatures-WordBreaking /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-WinOcr-Opt /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-TextPrediction-Dictionaries /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Spelling /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Hyphenation /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-HgsClient /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Onecore-Identity-TenantRestrictions /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-SearchEngine /NoRestart

DISM /Online /Remove-Package /PackageName:WindowsSearchEngineSKU /NoRestart


DISM /Online /Remove-Package /PackageName:RemoteDesktopServices /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-RDC /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Remote /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-IIS /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-CoreSystem-RemoteFS-Client /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-msmq /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-MSMQ /NoRestart

DISM /Online /Remove-Package /PackageName:MSMQ-Driver /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-COM-MSMQ /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Help /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Internet /NoRestart

DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Browser /NoRestart

rem # Disable Reserved Storage
DISM /Online /Set-ReservedStorageState /State:Disabled /NoRestart

rem # REBOOT RECOMMENDED

PAUSE
