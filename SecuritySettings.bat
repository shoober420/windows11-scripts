rem # Disables security settings

rem # Turns off all security settings which cause stuttering in games

PAUSE

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB1Protocol $false

ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB2Protocol $false

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

PAUSE