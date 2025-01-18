rem # Disable and remove Windows features
rem # Windows update services required for DISM
rem # "DISM /online /get-features /format:table" shows installed features
rem # "Get-WindowsOptionalFeature -Online" shows installed features

rem # Possible AUTO-REBOOT if ran without admin privileges

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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "0" /f

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

rem TLS 1.2 or lower is required for Windows Update to work, TLS 1.3 not supported yet
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "Enabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client" /v "DisabledByDefault" /t REG_DWORD /d "0" /f

Dism /Online /Disable-Feature /FeatureName:MediaPlayback /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:MSRDC-Infrastructure /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Printing-Foundation-Features /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Printing-XPSServices-Features /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:SMB1Protocol /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:SearchEngine-Client-Package /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:WCF-TCP-PortSharing45 /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Windows-Defender-Default-Definitions /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:WorkFolders-Client /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:NetFx3 /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:LegacyComponents /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:DirectPlay /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-All
Dism /Online /Disable-Feature /FeatureName:Client-ProjFS /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:TelnetClient /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:TFTP /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:TIFFIFilter /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:NetFx4-AdvSrvs /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:WCF-Services45 /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:SimpleTCP /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Microsoft-RemoteDesktopConnection /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:DirectoryServices-ADAM-Client /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:SmbDirect /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:MSRDC-Infrastructure /Quiet /NoRestart
Dism /Online /Disable-Feature /FeatureName:Recall /Quiet /NoRestart

DISM /Online /Disable-Feature /featurename:SNMP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WMISnmpProvider /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Windows-Identity-Foundation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:DirectoryServices-ADAM-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServerRole /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CommonHttpFeatures /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpErrors /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpRedirect /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ApplicationDevelopment /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-NetFxExtensibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-NetFxExtensibility45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HealthAndDiagnostics /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LoggingLibraries /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-RequestMonitor /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpTracing  /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Security /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-URLAuthorization /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-RequestFiltering /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IPSecurity /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Performance /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpCompressionDynamic /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServerManagementTools /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementScriptingTools /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IIS6ManagementCompatibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Metabase /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-WindowsActivationService /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-ProcessModel /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-ConfigurationAPI /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HostableWebCore /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CertProvider /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WindowsAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DigestAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ClientCertificateMappingAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IISCertificateMappingAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ODBCLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-StaticContent /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DefaultDocument /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DirectoryBrowsing /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebDAV /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebSockets /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ApplicationInit /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASPNET /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASPNET45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CGI /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ISAPIExtensions /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ISAPIFilter /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ServerSideIncludes /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CustomLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-BasicAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpCompressionStatic /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementConsole /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementService /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WMICompatibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LegacyScripts /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LegacySnapIn /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPSvc /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPExtensibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Container /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Server /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Triggers /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-ADIntegration /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-HTTP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Multicast /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-DCOMProxy /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-HTTP-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-TCP-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-Pipe-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-MSMQ-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-HTTP-Activation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-NonHTTP-Activation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Windows-MobilePC-Client-Premium-Package-net /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-XPSServices-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:RasCMAK /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:RasRip /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSRDC-Infrastructure /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TelnetClient /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TelnetServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TFTP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TIFFIFilter /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WorkFolders-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SMB1Protocol /Remove /NoRestart
DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Client /Remove /NoRestart
DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Server /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SMB2Protocol /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-All /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Tools-All /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Management-Clients /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Management-PowerShell /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MFaxServicesClientPackage /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MediaPlayback /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:LegacyComponents /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-PrintToPDFServices-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-Foundation-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-Foundation-InternetPrinting-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SmbDirect /Remove /NoRestart

dism /online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Components-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-CodeIntegrity-Diagnostics-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-HypervisorEnforcedCodeIntegrity-Sysprep-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-HypervisorEnforcedCodeIntegrity-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-OneCore-VirtualizationBasedSecurity-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-DeviceGuard-GPEXT-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Nis-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Management-Powershell-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Management-MDM-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Management-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Group-Policy-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Core-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Client-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-WOW64-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-AppLayer-Group-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-AM-Default-Definitions-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-AM-Default-Definitions-OptionalWrapper-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard-Inbox-Package /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-Group-Policy-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Components-WOW64-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-HVSI-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-HVSI-WOW64-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-SecurityCenter /NoRestart
dism /online /Remove-Package /PackageName:Multimedia-RestrictedCodecsDolby /NoRestart
dism /online /Remove-Package /PackageName:RemoteDesktopServices-Base-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-SMB /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-Smb /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-Telnet-Client-Opt /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-Telnet-Client-FOD-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-TFTP-Client-FOD-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-WMPNetworkSharingService /NoRestart
dism /online /Remove-Package /PackageName:OpenSSH-Client /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-Internet-Browser-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-Windows-MicrosoftEdgeDevToolsClient-Package /NoRestart
dism /online /Remove-Package /PackageName:Microsoft-hyper-v-all /NoRestart
dism /online /Remove-Package /PackageName:Client-ProjFS /NoRestart
dism /online /Remove-Package /PackageName:TelnetClient /NoRestart
dism /online /Remove-Package /PackageName:TFTP /NoRestart
dism /online /Remove-Package /PackageName:TIFFIFilter /NoRestart
dism /online /Remove-Package /PackageName:NetFx4-AdvSrvs /NoRestart
dism /online /Remove-Package /PackageName:WCF-Services45 /NoRestart

dism /online /Remove-Package /PackageName:VirtualMachinePlatform /NoRestart
dism /online /Remove-Package /PackageName:HypervisorPlatform /NoRestart
dism /online /Remove-Package /PackageName:Containers /NoRestart
dism /online /Remove-Package /PackageName:Windows-Defender-ApplicationGuard /NoRestart
dism /online /Remove-Package /PackageName:Containers-DisposableClientVM /NoRestart

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

PAUSE
