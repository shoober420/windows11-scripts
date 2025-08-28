rem # Disables security settings

rem # Turns off all security settings which cause stuttering in games

rem # Use EnableKernelMitigationOptions.reg to turn on exploit protection settings

rem # !!! WARNING !!!

rem # NOT COMPATIBLE WITH THESE ANTICHEATS:

rem # FACEIT
rem # VANGUARD (Valorant / League of Legends)

rem # !!! WARNING !!!

rem # SUPPORTS:
rem # ----------
rem # VAC
rem # EasyAntiCheat

PAUSE

rem # Disable Exception Chain Validation
rem # Causes stuttering in games
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f

rem # Disable Structured Exception Handling Overwrite Protection (SEHOP)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPByHandle" /t REG_DWORD /d "0" /f

rem # Disable Address Space Layout Randomization (ASLR) / Virtual Address Space Randomization (VASR)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableVirtualAddressSpaceRandomization" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f

rem # Disable Control Flow Guard (CFG)
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableControlFlowFlowGuardXgf" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableControlFlowGuardExportSuppression" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableControlFlowGuardXfg" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnableControlFlowLowGuardExportSuppression" /t REG_DWORD /d "0" /f

rem # Disable Data Execution Prevention (DEP)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v "DEPOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d "1" /f

rem # Turn off heap termination on corruption
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoHeapTerminationOnCorruption" /t REG_DWORD /d "1" /f

rem # Turn off shell protocol protected mode
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "PreXPSP2ShellProtocolBehavior" /t REG_DWORD /d "0" /f

rem # Disable Security features
rem # Causes stuttering in games
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f

rem # Disable Windows File Protection (WFP)
rem # https://www.securityspace.com/smysecure/catid.html?id=1.3.6.1.4.1.25623.1.0.10449
rem # 0 = WFP On / 1 = Disable WFP / 2 = Disable WFP for the next system restart only / 0xFFFFFF9D = Disable WFP
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "SFCDisable" /t REG_DWORD /d "0xffffff9d" /f

rem # Disable HTML Help Data Execution Prevention (HHDEP)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableHHDEP" /t REG_DWORD /d "1" /f

rem # Enable svchost.exe mitigation options
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SCMConfig" /v "EnableSvchostMitigationPolicy" /t REG_DWORD /d "0" /f

rem # Disable Administrator, LSA, Tamper, and Network Protection
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f

rem # 0 cripples FPS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ObjectSecurityMode" /t REG_DWORD /d "1" /f



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

rem # Disable Data Execution Prevention (DEP)
rem # Fixes stuttering in games
bcdedit /set nx AlwaysOff

rem # Disable DMA memory protection and cores isolation
rem # Disable Virtual Secure Mode (VSM)
rem # Disable Hyper-V
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
bcdedit /set hypervisorlaunchtype Off
bcdedit /set hypervisordebug Off
bcdedit /set hypervisoriommupolicy Disable

rem # Disable some of the kernel memory mitigations
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

ECHO Y | powershell.exe Set-SmbClientConfiguration -EnableSMBQUIC $false
ECHO Y | powershell.exe Set-SmbClientConfiguration -AuditServerDoesNotSupportEncryption $true
ECHO Y | powershell.exe Set-SmbClientConfiguration -AuditServerDoesNotSupportSigning $true
ECHO Y | powershell.exe Set-SmbServerConfiguration -AuditClientDoesNotSupportEncryption $true
ECHO Y | powershell.exe Set-SmbServerConfiguration -AuditClientDoesNotSupportSigning $true

PAUSE