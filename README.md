# Windows Scripts

Its not only about FPS, but also latency.

----------------------------------------------------------

AV software is bloat, DisableWindowsDefender.bat and Internet&SecuritySettings.bat are NOT viruses. (AME!MTB, Ulthar, and Wacatac FALSE POSITIVES)

Windows Firewall is bloat, use router firewall.

Windows Security > Virus & threat protection > Virus & threat protection settings > Manage settings > Disable all options

Windows Security > Virus & threat protection > Virus & threat protection settings > Exclusions > Add or remove exclusions > Add an exclusion > Folder > %USERPROFILE%\Downloads\windows11-scripts-main

Right click > Run as administrator

----------------------------------------------------------

NOTE:
If at any point during the process you get stuck at "Just a moment..." screen before login, press CTRL+ALT+DEL to force login screen to show

NOTE:
Make sure to disable any unused network adapters under Device Manager, or scripts may run very slow

# Instructions

Update BIOS

RESTART

Run Windows update

RESTART

 - DisableUAC.bat
 - EnablePowershell.bat
 - RemoveWindowsTerminal.bat

Update NIC Drivers
 - NetworkSettings.txt
 - NetworkOptions.txt

Install TCP Optimizer
 - https://www.speedguide.net/downloads.php
 - TCPOptimizer.txt

Install Intel DSA (Driver Support Assistant)
 - Download (https://www.intel.com/content/www/us/en/support/detect.html)
 - Check for updates with Intel DSA

RESTART (hold SHIFT while restarting)

Troubleshoot > Advanced options > Startup Settings > Restart > 7) Disable driver signature enforcement

Update Video Drivers
 - NVIDIA: https://www.nvidia.com/download/find.aspx
  + NVIDIA Vulkan beta drivers (not recommended): https://developer.nvidia.com/vulkan-driver
 - NVCleanstall.txt
 - NVIDIA Control Panel: https://github.com/Aetopia/Install-NVCPL

 - AMD: https://www.amd.com/en/support

RESTART

 - RemoveWindowsApps.bat
 - RemoveWindowsFeatures.bat

RESTART

Install DirectX End-User Runtime Web Installer (dxwebsetup.exe)
- Download (https://www.microsoft.com/en-us/download/details.aspx?id=35)

Install SetACL
 - Download (https://helgeklein.com/download/)
 - Extract into %USERPROFILE%\Downloads

Download Winget
 - InstallWinget.bat

Download Powershell
 - InstallPowershell.bat

Download Notepad++
 - InstallNotepad++.bat

Download Microsoft Visual C++ Redistributables
 - VCRedist.bat

Download Chrome Canary
 - InstallChromeCanary.bat

Update Winget programs
 - WingetUpdateApps.bat

- RemoveRemoteDesktopConnection.bat
- Internet&SecuritySettings.bat

Install Intel Chipset INF Utility
 - Download (https://www.intel.com/content/www/us/en/download/19347/chipset-inf-utility.html)

RESTART

Install and open CCleaner (optional)
 - Download (https://www.ccleaner.com/)
 - Launch CCleaner
 - Run Registry Cleaner
 - Tools > Registry > Scan for Issues
 - Run multiple times until same registry errors occur

RESTART (SAFE MODE) (hold SHIFT while restarting)

 - SetACL.bat (required for taking ownership of Windows Defender services and other bloat)
 - DisableWindowsDefender.bat (AV software is bloat)
 - DisableWindowsFirewall.bat (use router firewall)
 - DisableWindowsSecurityCenter.bat

 - DisableSAM.bat (black screen and unresponsive desktop if LanmanServer is enabled)
 - DisableLanmanServer.bat
 - DisableEventTraceSessions.bat
 - DisableStartMenu.bat
 - DisableComponents.bat
 - DisableWindowsSearch.bat (if skipped, file explorer and system will hang and freeze)
 - DeleteFonts.bat
 - Windows11Tweaks.bat (if skipped, admin privileges are borked)

RESTART

 - MouseAccelFix.bat (Display > Scale: 100% required)
 - !!! PowerPlanUltra.bat (only if Ultimate Performance power plan profile is NOT present: powercfg -L)
 - PowerPlanSettings.bat
 - ThreadQuantum.bat
 - DisableWinHTTP.bat (WIRED CONNECTION ONLY)

 - DNS.ps1
 - NICProperties.ps1

 - NetworkTweaks.bat (script settings need tweaked to match users computer hardware)
 - RAMTweaks.bat (script settings need tweaked to match users computer hardware)
 - GPUTweaks.bat (script settings need tweaked to match users computer hardware)
 - CPUTweaks.bat (script settings need tweaked to match users computer hardware)
 - InputTweaks.bat (script settings need tweaked to match users computer hardware)
 - UseLargePages.bat (add programs to enable Large Pages for them)
 - HighPriority.bat (add programs to enable High Priority for them)

 - Disable*.bat (DisableAppX.bat causes File Explorer to crash when opening right click context menu) (DO NOT RUN DisableStateRepository.bat and DisableDNSClient.bat)

RESTART

- nvidiaProfileInspectorForkAIO: load PerformanceProfile.nip or HighQualityProfileOGL.nip / HighQualityProfileD3D.nip (https://github.com/neatchee/nvidiaProfileInspectorForkAIO)
- Disable Drivers in Device Manager using DeviceManager.txt as reference (devmgmt.msc)

RESTART

- Setup Microsoft Interrupt Affinity Tool

RESTART

- StartUpBATs.bat (run everytime after login)
- RefreshRate.bat (script settings need tweaked to match users computer hardware)
- HDR_Switch.vbs

Steve Gibson ShieldsUp! firewall test
 - grc.com

# Windows Scripts

Windows11Checklist.txt (information on tweaks)

Windows11Tweaks.bat (Disables Telemetry required for Windows Insider Updates, run EnableWindowsUpdate.bat to fix) (Removes and disables Microsoft Edge) (recommended to run in SAFE MODE)

DisableWindowsUpdate.bat / EnableWindowsUpdate.bat

DisableWMI.bat / EnableWMI.bat (needed for powershell and systeminfo)

DisableUI.bat / EnableUI.bat

DisableStore.bat / EnableStore.bat

DisableComponents.bat / EnableComponents.bat (Disables Windows Store and UWP apps) (recommended to run in SAFE MODE)

wing3t.bat

VCRedist.bat

HKCUdsound.reg (adds dsound registry keys needed for older games, like Max Payne)

DisableBluetooth.bat / EnableBluetooth.bat

DisableAppX.bat / EnableAppX.bat (Disabling AppXSvc causes File Explorer to crash frequently)

DisableWinHTTP.bat / EnableWinHTTP.bat (borks WiFi and wireless internet if disabled)

DisableStateRepository.bat / EnableStateRepository.bat (WARNING: breaks system configuration settings, like power options) (WARNING: Breaks GUI, like taskbar, icons, and background)

run.bat

acl.txt (ACL: Access Control List - needed to take ownership of registry keys for services)

PowerPlanUltra.bat (adds duplicate Ultra power plan everytime command is executed, so use PowerPlanUltra.bat only if Ultimate Performance power plan profile is NOT present)

DisableServices.bat

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

DisableEventTraceSessions.bat (disable logs) (must run in SAFE MODE after using SetACL.bat)

DDU.txt (Display Drivers Uninstaller)

NVProfileInspectorPerf.txt / NVProfileInspectorHQ.txt

PerformanceProfile.nip / HighQualityProfileOGL.nip / HighQualityProfileD3D.nip (NVProfileInspector profiles)

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

DisableStartMenu.bat / EnableStartMenu.bat (recommended to run in SAFE MODE)

DisablePowerShell.bat / EnablePowerShell.bat

TaskbarChevronHide.bat / TaskbarChevronShow.bat

ProductKey.bat

UpdatePython.txt

RefreshRate.bat

RestartExplorer.bat

LaunchNVControlPanel.bat

LaunchAddRemovePrograms.bat

LaunchMouseProperties.bat

LaunchMultimediaProperties.bat

LaunchSystemProperties.bat

LaunchDeviceManager.bat

HDR_Switch.vbs

LaunchControlPanel.bat

RemoveActivateWindowsWatermark.bat

BandcampDownloader.txt

dxvk.conf (place in game exe directory / were logs are generated)

EnableDXVK_HUD.reg / RemoveDXVK_HUD.reg

EnableRTXRemixVulkanBeta.reg / RemoveRTXRemixVulkanBeta.reg

InstallWinget.bat

InstallPowershell.bat

InstallChromeCanary.bat

RemoveWindowsTerminal.bat

DisableSAM.bat / EnableSAM.bat (Causes black screen and unresponsive desktop if LanmanServer is enabled) (requires SAFE MODE and SetACL.bat to be run first)

DisableSGRMBroker.bat / EnableSGRMBroker.bat

DisableWebThreatDefense.bat / EnableWebThreatDefense.bat

DisableWindowsSecurityCenter.bat / EnableWindowsSecurityCenter.bat (Requires SAFE MODE and SetACL.bat to be run first)

DisableTrustedInstaller.bat / EnableTrustedInstaller.bat (Requires SAFE MODE and SetACL.bat to be run first)

DisableNetworkSetupService.bat / EnableNetworkSetupService.bat (required for Windows Updates)

InstallNotepad++.bat

DisableWebAccountManager.bat / EnableWebAccountManager.bat (May cause black screen after login)

DisableWindowsSearch.bat / EnableWindowsSearch.bat (Causes system hangs and freezes when enabled)

DisableUAC.bat / EnableUAC.bat

DisableLanmanServer.bat / EnableLanmanServer.bat

TCPOptimizer.txt (https://www.speedguide.net/downloads.php)

NetworkSettings.txt

NetworkOptions.txt

DisableDNSClient.bat / EnableDNSClient.bat (DO NOT USE) (Was able to be disabled in Windows 7)

DisableCOM+EventSystem.bat / EnableCOM+EventSystem.bat

DisableDriverSignatureEnforcement.bat

RemoveRemoteDesktopConnection.bat

RemoveWebView2.bat

RemoveCloudExperienceHost.bat

RemovePeopleExperienceHost.bat

RemoveShellExperienceHost.bat

RemoveStartMenuExperienceHost.bat

RemoveXboxGameCallableUI.bat

RemoveMicrosoftEdge.bat

RemoveSecurityHealthUI.bat

RemoveNarratorQuickStart.bat

RemoveContentDeliveryManager.bat

RemoveAADBrokerPlugin.bat

RemoveCapturePicker.bat

RemovePhoton.bat

RemoveParentalControls.bat

RemovePrintQueueActionCenter.bat

RemoveMicrosoftUIXamlCBS.bat / InstallMicrosoftUIXamlCBS.bat (causes constant screen flicker and blinking when removed)

DisableTouchPad.bat / EnableTouchPad.bat

BlockRazerSynapse.bat (prevents Razer Synapse auto install rubber ducky attack)

InputTweaks.bat (script settings need tweaked to match users computer hardware)

DNS.ps1

NICProperties.ps1

StaticIPConnection.bat

DHCPConnection.bat

DisableDHCP.bat / EnableDHCP.bat

DisablePowerManagement.ps1