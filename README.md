# Windows Scripts

Its not only about FPS, but also latency.

----------------------------------------------------------

AV software is bloat, DisableWindowsDefender.bat and SecuritySettings.bat are NOT viruses. (Disabler.AME!MTB, Ulthar, Sabsik, Wacatac, and Kepavll!rfn FALSE POSITIVES)

Windows Firewall is bloat, use router firewall.

Windows Security > Virus & threat protection > Virus & threat protection settings > Manage settings > Disable all options

Windows Security > Virus & threat protection > Virus & threat protection settings > Exclusions > Add or remove exclusions > Add an exclusion > Folder > %USERPROFILE%\Downloads\windows11-scripts-main

Google Chrome > Settings > Privacy and security > Security > Safe Browsing > No protection 

Right click > Run as administrator

----------------------------------------------------------

NOTE: Reinstall Windows from USB ISO to fully restore apps, registry, and original settings

NOTE: Doing a "Refresh your PC: Local reinstall" will NOT install deleted Windows apps and NOT restore original registry fully, "Cloud download" option recommended if USB ISO unavailable

**Each installation choice has its own batch script for easy setup**

**Installation Video Tutorial:**
https://youtu.be/YNqtGV2IZqc?si=1cAnEc_uCMp0Yho6

# Minimal_Install.bat
 - EnablePowerShell.bat
 - VCRedist.bat
 - InternetSettings.bat
 - DisablePerProcessSystemDPI.bat
 - MouseAccelFix.bat
 - NICProperties.bat
 - NetworkTweaks.bat
 - DisableNetBIOS.ps1
 - DNS.ps1
 - PowerPlanUltra.bat
 - DisableFullscreenOptimizations.bat
 - AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat
 - NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip
 - ThreadQuantum.bat
 - RemoveRemoteDesktopConnection.bat
 - MTU.bat

# Standard_Install.bat
 - EnablePowerShell.bat
 - VCRedist.bat
 - CPUTweaks.bat
 - GPUTweaks.bat / AMDGPUTweaks.bat / NVGPUTweaks.bat
 - HardDrive_Tweaks.bat
 - USBTweaks.bat
 - AboveNormalPriority.bat
 - InputTweaks.bat
 - InternetSettings.bat
 - SecuritySettings.bat
 - DisablePerProcessSystemDPI.bat
 - MouseAccelFix.bat
 - NICProperties.bat
 - NetworkTweaks.bat
 - DisableNetBIOS.ps1
 - DNS.ps1
 - PowerPlanUltra.bat
 - DisableFullscreenOptimizations.bat
 - AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat
 - NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip
 - DisableScheduledTasks.ps1 / DisableScheduledTasks.bat
 - DisableLanmanWorkstation.bat
 - DisableLanmanServer.bat
 - DisableIPHelper.bat
 - DisableNetBIOSHelper.bat
 - DisableUPnPDeviceHost.bat
 - DisableSSDPDiscovery.bat
 - DisableEdge.bat
 - RAMTweaks.bat
 - ThreadQuantum.bat
 - UseLargePages.bat
 - MTU.bat
 - RemoveRemoteDesktopConnection.bat
 - DisableHighPrecisionEventTimer.bat

# Advanced_Install.bat
 - EnablePowerShell.bat
 - VCRedist.bat
 - CPUTweaks.bat
 - GPUTweaks.bat / AMDGPUTweaks.bat / NVGPUTweaks.bat
 - KernelTweaks.bat
 - TimerTweaks.bat
 - HardDrive_Tweaks.bat
 - USBTweaks.bat
 - AboveNormalPriority.bat
 - InputTweaks.bat
 - InternetSettings.bat
 - SecuritySettings.bat
 - DisablePerProcessSystemDPI.bat
 - MouseAccelFix.bat
 - NICProperties.bat
 - NetworkTweaks.bat
 - DisableNetBIOS.ps1
 - DNS.ps1
 - PowerPlanUltra.bat
 - DisableFullscreenOptimizations.bat
 - AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat / EnableAMDGPU_DalDramClockChangeLatencyNs.bat
 - NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip
 - DisableScheduledTasks.ps1 / DisableScheduledTasks.bat
 - DisableIntegratedGPU.ps1
 - DisableBluetooth.bat
 - DisableTouchPad.bat
 - DisableHDR.bat / EnableHDR.bat
 - DisableSysMain.bat
 - DisableEdge.bat
 - DisableTPM+SecureBoot.bat
 - DisableBitLocker.bat
 - DisableCPUMitigations.bat
 - DisableMIDI2.0.bat
 - RemoveFirewallRules.bat
 - DisableDHCP.bat / StaticIPConnection.bat / DisableWinHTTP.bat / DisableWLAN_AutoConfig.bat
 - DisablePowerManagement.ps1
 - RAMTweaks.bat
 - ThreadQuantum.bat
 - UseLargePages.bat
 - EnableClearPageFileAtShutdown.bat
 - DisablePageFile.bat
 - RemoveRemoteDesktopConnection.bat
 - RemoveWindowsApps.bat
 - RemoveWindowsFeatures.bat
 - EnableSerializeTimerExpiration.bat
 - DisableThreadDPC.bat
 - MaxPendingInterrupts.reg
 - ResourceSets.reg
 - Base+OverTargetPriorities.reg
 - BCDEDIT_Tweaks.bat
 - SetTimerResolution.bat
 - DWM_ExclusiveModeFramerateAveragingPeriodMs.bat
 - DWM_Tweaks.bat
 - Windows11Tweaks.bat
 - DisableServicesInternet.bat
 - DisableComponents.bat
 - DisableStartMenu.bat
 - DisableShellExperienceHost.bat
 - MTU.bat
 - DeviceManager.bat
 - WallpaperSolidColor.bat
 - Theme.bat
 - AccentColor.bat
 - DisableSSL+LegacyTLS.bat

  - Decrypt+OSCompression.bat

NOTE:
If at any point during the process you get stuck at "Just a moment..." screen before login, press CTRL+ALT+DEL to force login screen to show

NOTE:
Make sure to disable any unused network adapters under Device Manager, or scripts may run very slow

# Expert Install Instructions

Update BIOS

Update TPM

Update NVMe / SSD Firmware
- Samsung Magician: (https://semiconductor.samsung.com/consumer-storage/magician)
- Western Digital: SanDisk Dashboard (https://support-en.sandisk.com/app/answers/detailweb/a_id/31759)

Tweak BIOS

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

 - AMD BETA: https://www.techpowerup.com/download/amd-radeon-graphics-drivers/
 - AMD: https://www.amd.com/en/support/download/drivers.html
  + AMD Vulkan Drivers: https://www.amd.com/en/resources/support-articles/release-notes/RN-RAD-WIN-VULKAN.html

 - Intel 7th-10th Gen Processor Video Drivers: https://www.intel.com/content/www/us/en/download/776137/intel-7th-10th-gen-processor-graphics-windows.html

RESTART

 - RemoveWindowsApps.bat
 - RemoveWindowsApps2.bat
 - RemoveAllWindowsApps.bat
 - RemoveWindowsFeatures.bat

RESTART

Install DirectX End-User Runtime Web Installer (dxwebsetup.exe)
- Download (https://www.microsoft.com/en-us/download/details.aspx?id=35)

Install SetACL
 - Download (https://helgeklein.com/download/)
 - Extract into %USERPROFILE%\Downloads

Download SetTimerResolution
 - https://github.com/valleyofdoom/TimerResolution

Download Winget
 - InstallWinget.bat

Download Powershell
 - InstallPowershell.bat

Download Notepad++
 - InstallNotepad++.bat

Download Microsoft Visual C++ Redistributables
 - VCRedist.bat

Download Chromium
 - https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/

Download Chrome Canary
 - InstallChromeCanary.bat

Update Winget programs
 - WingetUpdateApps.bat

- RemoveRemoteDesktopConnection.bat
- InternetSettings.bat
- SecuritySettings.bat

Install Intel Chipset INF Utility
 - Download (https://www.intel.com/content/www/us/en/download/19347/chipset-inf-utility.html)

RESTART

Download Bleachbit
 - https://www.bleachbit.org/download/windows
 - REQUIRES WMI

Install and open CCleaner (optional)
 - Download (https://www.ccleaner.com/)
 - Launch CCleaner
 - Run Registry Cleaner
 - Tools > Registry > Scan for Issues
 - Run multiple times until same registry errors occur

RESTART (SAFE MODE) (hold SHIFT while restarting)

 - Expert_Install.bat
  + SetACL.bat (required for taking ownership of Windows Defender services and other bloat)
  + DisableWindowsDefender.bat (AV software is bloat)
  + DisableWindowsFirewall.bat (use router firewall)
  + DisableWindowsSecurityCenter.bat
  + DisableEventTraceSessions.bat
  + DisableSAM.bat (black screen and unresponsive desktop if LanmanServer is enabled)

  + DisableLanmanServer.bat
  + DisableStartMenu.bat
  + DisableComponents.bat
  + DisableWindowsSearch.bat (if skipped, file explorer and system will hang and freeze)
  + DeleteFonts.bat
  + Windows11Tweaks.bat (if skipped, admin privileges are borked)

RESTART

 - MouseAccelFix.bat (Display > Scale: 100% required)
 - PowerPlanUltra.bat
 - ThreadQuantum.bat
 - DisableWinHTTP.bat (WIRED CONNECTION ONLY)
 - NICProperties.bat

 - NetworkTweaks.bat
 - DNS.ps1
 - RAMTweaks.bat
 - GPUTweaks.bat
 - NVGPUTweaks.bat / AMDGPUTweaks.bat
 - KernelTweaks.bat
 - CPUTweaks.bat
 - TimerTweaks.bat
 - InputTweaks.bat (script settings need tweaked to match users computer hardware)
 - HardDrive_Tweaks.bat
 - USBTweaks.bat
 - UseLargePages.bat (add programs to enable Large Pages for them)
 - AboveNormalPriority.bat (add programs to enable Above Normal Priority for them)
 - EnableDirectXUserGlobalSettings.bat
 - DeviceManager.bat

 - DisableOverlays.bat (IF CRASHING, FLICKERING, AND LOW FPS OCCUR, RUN EnableOverlays.bat)

 - EnableAMDGPU_DalDramClockChangeLatencyNs.bat (only for Radeon cards, disable if screen flickering occurs)

 - Disable*.bat (DisableAppX.bat causes File Explorer to crash when opening right click context menu) (DO NOT RUN DisableStateRepository.bat and DisableDNSClient.bat)
 - Remove*.bat

 - StaticIPConnection.bat

RESTART

- https://github.com/xHybred/NvidiaProfileInspectorRevamped
- load NVIDIAPerformanceProfile.nip or NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

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

DisableWindowsUpdate.bat / EnableWindowsUpdate.bat (required for DISM)

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

PowerPlanUltra.bat

DisableThemes.bat / EnableThemes.bat

DisableGraphicsPerfSvc.bat / StartGraphicsPerfSvc.bat

RemoveWindowsFeatures.bat (Windows Update services required for DISM)

InternetSettings.bat (powershell requires WMI service)

icons.bat

WingetUpdateApps.bat (winget requires Application Information service)

RemoveWindowsApps.bat (requires winget and powershell) (EnableStore.bat required for this script to function if DisableServices.bat was executed)

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

DeleteCache+Logs.bat

WindowsFix.bat (standard fixes to troubleshoot Windows systems with issues and bugs)

WindowsUpdateFix.bat (fixes Windows Update errors and bugs)

SafeMode.txt (multiple methods to get into Safe Mode)

TaskbarHide.bat / TaskbarShow.bat

InstallScoop.bat

Steam.bat (minimal and bloatless Steam launch script)

MouseAccelFix.bat

NetworkTweaks.bat (Recommened to run DNS.ps1 for optimal DNS settings)

ComputerName.bat (change computer name and Hostname)

RAMTweaks.bat

NVGPUTweaks.bat

ThreadQuantum.bat

Date+TimeShow.bat / Date+TimeHide.bat (show or hide taskbar date and time on bottom right)

InstallChocolatey.bat

CPUTweaks.bat

GPUTweaks.bat

UseLargePages.bat (add user programs to enable Large Pages for them)

AboveNormalPriority.bat (add user programs to enable Above Normal Priority for them)

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

InstallWinget.bat / InstallWinget.ps1

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

DNS.bat / DNS.ps1 (required to run after launching Windows11Tweaks.bat and NetworkTweaks.bat)

NICProperties.bat

StaticIPConnection.bat

DHCPConnection.bat

DisableDHCP.bat / EnableDHCP.bat

DisablePowerManagement.ps1

TestModeOn.bat / TestModeOff.bat

AMDGPUTweaks.bat

DisableBitLocker.bat (Installing Windows 11 without TPM and SecureBoot in Rufus is required to fully disable BitLocker)

DownloadFile.ps1

DownloadZipFile.ps1

DisableSSL+LegacyTLS.bat (TLS1.2 required for Windows Update and DISM)

DisableTLS1.2.bat / EnableTLS1.2.bat (TLS1.2 required for Windows Update and DISM)

SecuritySettings.bat

DisableTPM+SecureBoot.bat (MUST BE LAUNCHED BEFORE WINDOWS 11 INSTALLATION TO DISABLE TPM AND SECUREBOOT) (TPM MUST BE ON IN BIOS FOR NEW WINDOWS UPDATE CANARY BUILDS TO INSTALL) (TPM AND SECUREBOOT MUST BE DISABLED TO DO A WINRE "RESET THIS PC" WITHOUT A RECOVERY KEY BEING NEEDED) (DISABLE TPM AND SECUREBOOT IN BIOS BEFORE MODIFIED RUFUS FRESH WINDOWS INSTALL) (TPM AND SECUREBOOT ARE USED WITH WINDOWS PIN LOGIN, DONT TPM.MSC > CLEAR TPM, BORKS LOGIN)

ShowFileExtensions.bat

ReplaceFooWithFoo.ps1 (useful for debugging)

DisableOverlays.bat / EnableOverlays.bat (IF CRASHING, FLICKERING, AND PERFORMANCE DECREASES, RUN EnableOverlays.bat)

HardDrive_Tweaks.bat

USBTweaks.bat

DisableAMDGPU_DalDramClockChangeLatencyNs.bat / EnableAMDGPU_DalDramClockChangeLatencyNs.bat (disable if screen flickering occurs)

DisableClearPageFileAtShutdown.bat / EnableClearPageFileAtShutdown.bat (long restarts and shut downs with large page file sizes when enabled)

RemoveWebViewHost.bat

RemoveWindowsAppRuntime.bat

RemoveWindowsClientCBS.bat

RemoveCredDialogHost.bat

RemoveXGpuEjectDialog.bat

RemovePrintDialog.bat

DeviceManager.bat

DisableHighPrecisionEventTimer.bat

DisableIntelPPM.bat / EnableIntelPPM.bat (NEEDS TO BE ENABLED FOR MAX TURBOBOOST FREQUENCIES IN CERTAIN LIMITED BIOS)

DisableLowQosTimerResolution.bat / EnableLowQosTimerResolution.bat (TESTING ONLY, CAUSES BLUE/GREEN SCREEN OF DEATH AT BOOT)

KernelTweaks.bat

ResourceSetTweaks.bat (TESTING ONLY, BREAKS SYSTEM)

DisableShellExperienceHost.bat / EnableShellExperienceHost.bat

DisableEdge.bat / EnableEdge.bat

DisableSENS.bat / EnableSENS.bat

DisableWindowsConnectionManager.bat / EnableWindowsConnectionManager.bat

DisableLanmanWorkstation.bat

DisableIPHelper.bat

DisableNetBIOSHelper.bat

DisableUPnPDeviceHost.bat

DisableSSDPDiscovery.bat

DisableNVIDIAContainer.bat

DisableServicesInternet.bat / EnableServicesInternet.bat

DisableServicesWindows.bat / EnableServicesWindows.bat

DisableServicesIntel.bat

DisableServicesAMD.bat

TimerTweaks.bat

AMDAdrenalinSettings.txt

DisableHDR.bat / EnableHDR.bat

DisableIntegratedGPU.ps1

DisableFullscreenOptimizations.bat / EnableFullscreenOptimizations.bat

DisableNetBIOS.ps1

DisableScheduledTasks.ps1

DisableMIDI2.0.bat / EnableMIDI2.0.bat

DisableVolumeShadowCopy.bat / EnableVolumeShadowCopy.bat (Glitches system when disabled)

DisableCommonLogFileSystem.bat / EnableCommonLogFileSystem.bat (breaks powershell and dism when disabled)

AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

DisableAMDHDAudioService.bat / EnableAMDHDAudioService.bat (Breaks sound coming from GPU HDMI to monitor when disabled)

RemoveNotepad.bat

RemoveAllWindowsApps.bat

AMDGPU_ColorDepth_BPC.ps1

AMDGPU_VividGaming.ps1

DisableSysMain.bat / EnableSysMain.bat

DisablePDC.bat / EnablePDC.bat (TESTING ONLY)

DisablePCW.bat / EnablePCW.bat (breaks Task Manager when disabled)

RemoveFirewallRules.bat (Windows Firewall is bloat, use router firewall)

DisableCldFlt.bat / EnableCldFlt.bat (breaks deskop files from opening when disabled)

MaxPendingInterrupts.reg

EnableKernelMitigationOptions.reg

DisableCPUMitigations.bat / EnableCPUMitigations.bat (GAMING PCS ONLY)

DisableScheduledTasks.bat

BCDEDIT_Tweaks.bat

DWM_Tweaks.bat

DisableSerializeTimerExpiration.bat / EnableSerializeTimerExpiration.bat

DisableThreadDPC.bat / EnableThreadDPC.bat

DisableDistributeTimers.bat / EnableDistributeTimers.bat

DisableGPUPreemption.bat / EnableGPUPreemption.bat (HAGS REQUIRES GPU PREEMPTION)

ResourceSets.reg

Base+OverTargetPriorities.reg

DisablePrefetcher.bat / EnablePrefetcher.bat

LaunchAMDAdrenalin.bat

DisableShellInfrastructureHost.bat / EnableShellInfrastructureHost.bat

DWM_ExclusiveModeFramerateAveragingPeriodMs.bat

WallpaperSolidColor.bat

DisableWLAN_AutoConfig.bat / EnableWLAN_AutoConfig.bat

Decrypt+OSCompression.bat

DisablePageFile.bat

Theme.bat

InstallWMIC.bat

AccentColor.bat

DisablePerProcessSystemDPI.bat / EnablePerProcessSystemDPI.bat

Minimal_Install.bat / Standard_Install.bat / Advanced_Install.bat / Expert_Install.bat

DisableActivateWindows.bat / EnableActivateWindows.bat

LaunchNotificationAreaIcons.bat

DisableWindowsWatermark.bat / EnableWindowsWatermark.bat

NVProfileInspector.bat

Defrag+TRIM.bat

InstallVim.bat

DisableNull.bat / EnableNull.bat (required for Discord and Android Debug Bridge: ADB)

TCP_AutoTuning.bat

DeleteWindowsOLD.bat (removes Windows.old directory)

DeleteWindowsBackups.bat

DisableVSS.bat / EnableVSS.bat

RemoveStore.bat / InstallStore.bat

LaunchStore.bat

NV_DSCTweak.bat (fixes black screen)

RemoveStartUpApps.bat

CustomResolutionUtility.txt

DisableAMDExternalEventsUtility.bat / EnableAMDExternalEventsUtility.bat (Locks FPS to monitor refresh rate for some games when DISABLED)

EnableSwapEffectUpgrade.bat

DisableKernelDPCTweaks.bat / EnableKernelDPCTweaks.bat

GPU_Scheduling.bat

InstallDirectPlay.bat / RemoveDirectPlay.bat

DisableSystemProfile.bat / EnableSystemProfile.bat

AMD_FrameRateTargetControl.bat

Install.NETDesktopRuntime.bat / Remove.NETDesktopRuntime.bat

# Credits
- https://www.elevenforum.com/members/garlin.5387
- https://www.elevenforum.com/members/csmc.38355
- jdallmann
- Kizzimo
- foss-lover34
- brusk9060
- dersk111y
- V3nilla
- ja2forever
- https://www.mdgx.com
- https://github.com/Batleman
- https://github.com/AlchemyTweaks
- https://github.com/TairikuOokami
- https://github.com/ionuttbara
- https://github.com/Hyyote
- https://github.com/MoriEdan
- https://github.com/NicholasBly
- https://github.com/rahilpathan
- https://github.com/ChrisTitusTech
- https://github.com/raspi
- https://github.com/simeononsecurity
- https://github.com/alufena
- https://sites.google.com/site/tweakradje/windows/windows-tweaking
- https://admx.help
- https://github.com/ancel1x/Ancels-Performance-Batch
- https://github.com/Batlez/Batlez-Tweaks
- https://sites.google.com/view/melodystweaks/basictweaks
- https://github.com/sherifmagdy32/gaming_os_tweaker
- https://github.com/HakanFly/Windows-Tweaks
- http://bbs.c3.wuyou.net/forum.php?mod=viewthread&tid=437913
- https://github.com/CrackedStuffEZ
