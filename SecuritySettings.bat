rem # Disables security settings

rem # Turns off all security settings which cause stuttering in games

PAUSE

powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB1Protocol $false

ECHO Y | powershell.exe Set-SmbServerConfiguration -EnableSMB2Protocol $false

powershell.exe Disable-ScheduledTask -TaskName 'Microsoft Compatibility Appraiser' -TaskPath '\Microsoft\Windows\Application Experience'

rem # https://learn.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2022-ps
rem # https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps
rem # Disable mitigations to fix stuttering in games

powershell.exe Set-MpPreference -PUAProtection 0
powershell.exe Set-MpPreference -EnableControlledFolderAccess Disabled

powershell.exe Set-Processmitigation -System -Disable DEP, EmulateAtlThunks, SEHOP, ForceRelocateImages, RequireInfo, BottomUp, HighEntropy, StrictHandle, DisableWin32kSystemCalls, AuditSystemCall, DisableExtensionPoints, BlockDynamicCode, AllowThreadsToOptOut, AuditDynamicCode, CFG, SuppressExports, StrictCFG, MicrosoftSignedOnly, AllowStoreSignedBinaries, AuditMicrosoftSigned, AuditStoreSigned, EnforceModuleDependencySigning, DisableNonSystemFonts, AuditFont, BlockRemoteImageLoads, BlockLowLabelImageLoads, PreferSystem32, AuditRemoteImageLoads, AuditLowLabelImageLoads, AuditPreferSystem32, EnableExportAddressFilter, AuditEnableExportAddressFilter, EnableExportAddressFilterPlus, AuditEnableExportAddressFilterPlus, EnableImportAddressFilter, AuditEnableImportAddressFilter, EnableRopStackPivot, AuditEnableRopStackPivot, EnableRopCallerCheck, AuditEnableRopCallerCheck, EnableRopSimExec, AuditEnableRopSimExec, SEHOP, AuditSEHOP, SEHOPTelemetry, TerminateOnError, DisallowChildProcessCreation, AuditChildProcess

rem # Disable Memory Compression
PowerShell -Command "Disable-MMAgent -MemoryCompression"

rem # Disable Page Combining
PowerShell -Command "Disable-MMAgent -PageCombining"

rem # Disable Data Execution Prevention (DEP)
rem # Fixes stuttering in games
BCDEDIT /SET {CURRENT} NX ALWAYSOFF
bcdedit /set nx optout

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