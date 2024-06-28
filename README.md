# Windows Batch Scripts

# Instructions
Update Video Drivers
 - NVIDIA: https://www.nvidia.com/download/find.aspx (NVCleanstall method preferred) (https://developer.nvidia.com/vulkan-driver)
 - AMD: https://www.amd.com/en/support

Install and run Intel DSA (Driver Support Assistant)
 - Download (https://www.intel.com/content/www/us/en/support/detect.html)
 - If already Installed, Uninstall and Reinstall using downloaded exe to get Launch option to appear after installation completes to run Intel DSA

RESTART

Run batch scripts
 - MouseAccelFix.bat
 - WingetUpdateApps.bat
 - RemoveWindowsApps.bat
 - RemoveWindowsFeatures.bat
 - Internet&SecuritySettings.bat
 - !!! PowerPlanUltra.bat (only if Ultimate Performance power plan profile is NOT present)
 - PowerPlanSettings.bat
 - ThreadQuantum.bat

RESTART

 - NetworkTweaks.bat (script settings need tweaked to match users computer hardware)
 - RAMTweaks.bat (script settings need tweaked to match users computer hardware)
 - GPUTweaks.bat (script settings need tweaked to match users computer hardware)
 - CPUTweaks.bat (script settings need tweaked to match users computer hardware)
 - UseLargePages.bat (add user programs to enable Large Pages for them)
 - HighPriority.bat (add user programs to enable High Priority for them)
 - Windows11Tweaks.bat (Removes and disables Microsoft Edge)
 - Disable*.bat (DisableAppX.bat causes File Explorer to crash frequently) (DO NOT RUN DisableStateRepository.bat and DisableWinHTTP.bat)

RESTART

If stuck at "Just a moment..." screen before login, press CTRL+ALT+DEL to force login screen to show

RESTART (SAFE MODE) (hold SHIFT while restarting)

 - SetACL.bat (required for taking ownership of Windows Defender services and other bloat)
 - DisableWindowsDefender.bat
 - DisableWindowsFirewall.bat (use router firewall instead)
 - DisableEventTraceSessions.bat
 - DisableComponents.bat (Disables Windows Store and UWP apps)
 - DisableServices.bat
 - DeleteFonts.bat

RESTART

- nvidiaProfileInspector: load PerformanceProfile.nip or HighQualityProfile.nip
- Disable Drivers in Device Manager (devmgmt.msc)

RESTART

Setup Microsoft Interrupt Affinity Tool

RESTART

StartUpBATs.bat (run everytime after login)

# Windows Batch Scripts

Windows11Checklist.txt (information on tweaks)

Windows11Tweaks.bat (Disables Telemetry required for Windows Insider Updates, run EnableWindowsUpdate.bat to fix) (Removes and disables Microsoft Edge) (to disable Windows Defender, run in SAFE MODE)

DisableWindowsUpdate.bat / EnableWindowsUpdate.bat

DisableWMI.bat / EnableWMI.bat (needed for powershell and systeminfo)

DisableUI.bat / EnableUI.bat

DisableStore.bat / EnableStore.bat

DisableComponents.bat / EnableComponents.bat (Disables Windows Store and UWP apps)

wing3t.bat

VCRedist.bat

HKCUdsound.reg (adds dsound registry keys needed for older games, like Max Payne)

DisableBluetooth.bat / EnableBluetooth.bat

DisableAppX.bat / EnableAppX.bat (Disabling AppXSvc causes File Explorer to crash frequently)

DisableWinHTTP.bat / EnableWinHTTP.bat (borks internet if disabled)

DisableStateRepository.bat / EnableStateRepository.bat (WARNING: breaks system configuration settings, like power options) (WARNING: Breaks GUI, like taskbar, icons, and background)

run.bat

acl.txt (ACL: Access Control List - needed to take ownership of registry keys for services)

PowerPlanUltra.bat (adds duplicate Ultra power plan everytime command is executed, so use PowerPlanUltra.bat only if Ultimate Performance power plan profile is NOT present)

DisableServices.bat (to disable Windows Defender, run in SAFE MODE)

DisableThemes.bat / EnableThemes.bat

StartGraphicsPerfSvc.bat

PowerPlanSettings.bat

RemoveWindowsFeatures.bat (windows update services required for DISM)

Internet&SecuritySettings.bat (powershell requires WMI service)

icons.bat

WingetUpdateApps.bat (winget requires Application Information service)

RemoveWindowsApps.bat (requires winget and powershell)

DisableAppInfo.bat / EnableAppInfo.bat

DisableNLA.bat / EnableNLA.bat (fixes internet)

ResetNetwork.bat

PowerPlanExtraOptions.bat (NOT RECOMMENDED)

NVCleanstall.txt

DeviceManager.txt

SetACL.bat (ACL: Access Control List - requires SetACL.exe to be in scripts directory) (required for taking ownership of Windows Defender services and other bloat)

InterruptAffinityPolicyTool.txt

WinInsiderBuildUpdateChecklist.txt (instructions for when a new Windows Insider build is installed)

SetTimerResolution.bat (script needed to launch SetTimerResolution.exe at boot)

DisableEventTraceSessions.bat (disable logs)

DDU.txt (Display Drivers Uninstaller)

NVProfileInspectorPerf.txt / NVProfileInspectorHQ.txt

PerformanceProfile.nip / HighQualityProfile.nip (NVProfileInspector profiles)

NVIDIAControlPanelHQ.txt / NVIDIAControlPanelPerf.txt

DownloadChromium.txt

UserManagement.txt

DisableRunasAdministrator.bat / EnableRunasAdministrator.bat

DisableIntelDSA.bat / EnableIntelDSA.bat

AdminCmdPrompt.bat

DisableMaintenanceServices.bat / EnableMaintenanceServices.bat

DeleteWindowsAppDir.bat

DisableWindowsFirewall.bat / EnableWindowsFirewall.bat (use router firewall instead)

DisableWindowsDefender.bat (AV software is bloat, run in SAFE MODE)

StartUpBATs.bat (Run this script after login every boot, executes SetTimerResolution.exe and disables services launched after login)

DeleteFonts.bat

DisableMicrophone.bat / EnableMicrophone.bat (Capability Access Manager Service is required for microphone to work)

EnableEssentialServices.bat

DownloadFirefox.txt

DeleteCache&Logs.bat

WindowsFix.bat (standard fixes to troubleshoot Windows systems with issues and bugs)

WindowsUpdateFix.bat (fixes Windows Update errors and bugs)

SafeMode.txt (multiple methods to get into Safe Mode)

TaskbarHide.bat / TaskbarShow.bat

InstallScoop.bat

Steam.bat (minimal and bloatless Steam launch script)

MouseAccelFix.bat

NetworkTweaks.bat (script settings need tweaked to match users computer hardware)

ComputerName.bat (change computer name and Hostname)

RAMTweaks.bat (script settings need tweaked to match users computer hardware)

GPUTweaks.bat (script settings need tweaked to match users computer hardware)

ThreadQuantum.bat

Date&TimeShow.bat / Date&TimeHide.bat (show or hide taskbar date and time on bottom right)

InstallChocolatey.bat

CPUTweaks.bat (script settings need tweaked to match users computer hardware)

UseLargePages.bat (add user programs to enable Large Pages for them)

HighPriority.bat (add user programs to enable High Priority for them)

DisableStartMenu.bat / EnableStartMenu.bat

DisablePowerShell.bat / EnablePowerShell.bat

TaskbarChevronHide.bat / TaskbarChevronShow.bat
