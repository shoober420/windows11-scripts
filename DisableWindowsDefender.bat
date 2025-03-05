rem # Disable all Windows Defender components

rem # AV Software is bloat
rem # Windows Firewall is bloat, use router firewall instead

rem # Recommended to run in SAFE MODE

rem # Requires SetACL.bat to be run first
rem # Gives ownership to reg keys

PAUSE

rem # Launch SetACL.bat to take ownership of reg keys
cd "%~dp0"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

reg add "HKLM\System\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecCore" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MpKsl863bd5cf" /v "Start" /t REG_DWORD /d "4" /f

rem # Disable Anti-malware and Network Realtime Inspection Services
takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform"
icacls "C:\ProgramData\Microsoft\Windows Defender\Platform" /grant:r %username%:F
taskkill /im MsMpEng.exe /f
taskkill /im NisSrv.exe
rem # del "C:\ProgramData\Microsoft\Windows Defender\Platform" /s /f /q
ren "C:\ProgramData\Microsoft\Windows Defender\Platform" "Platform.bak"

rem # Disable Microsoft Aggregator Host (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\System32\AggregatorHost.exe"
icacls "C:\Windows\System32\AggregatorHost.exe" /grant:r %username%:F
taskkill /im AggregatorHost.exe /f
rem del "C:\Windows\System32\AggregatorHost.exe" /s /f /q
ren "C:\Windows\System32\AggregatorHost.exe" "AggregatorHost.exe.bak"

rem https://www.elevenforum.com/t/turn-on-or-off-tamper-protection-for-microsoft-defender-antivirus-in-windows-11.3973
reg add "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d "0" /f

rem 1 - Antivirus Disabled Notification
reg add "HKLM\Software\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f

rem 0 - Security and Maitenance Notification
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.StartupApp" /v "Enabled" /t REG_DWORD /d "0" /f

rem 1 - Disable Real-time protection
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\MpEngine" /v "MpEnablePus" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SpynetReporting" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f

rem 0 - Disable Logging
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f

rem # Disable Tasks
schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable

rem # Disable systray icon
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f

rem # Remove context menu
reg delete "HKCR\*\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /f

rem # Disable Anti-malware Service Executable (to restore run "sfc /scannow")
rem takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe"
rem icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" /grant:r %username%:F
rem taskkill /im MsMpEng.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" /s /f /q
rem ren "C:\ProgramData\Microsoft\Windows Defender\Platform\*\MsMpEng.exe" "MsMpEng.exe.bak"

rem # Disable Microsoft Network Realtime Inspection Service (to restore run "sfc /scannow")
rem takeown /s %computername% /u %username% /f "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe"
rem icacls "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" /grant:r %username%:F
rem taskkill /im NisSrv.exe /f
rem del "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" /s /f /q
rem ren "C:\ProgramData\Microsoft\Windows Defender\Platform\*\NisSrv.exe" "NisSrv.exe.bak"

rem # Requires SetACL.bat to be run first
rem # Gives ownership to reg keys

PAUSE
