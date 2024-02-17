# Windows Batch Scripts
Win11Checklist.txt (information on tweaks)

Win11Tweaks.bat (to disable windows defender, run in SAFE MODE)

DisableWinUpdate.bat / EnableWinUpdate.bat

DisableWMI.bat / EnableWMI.bat (needed for powershell and systeminfo)

DisableUI.bat / EnableUI.bat

DisableStore.bat / EnableStore.bat

DisableComponents.bat / EnableComponents.bat

wing3t.bat

VCRedist.bat

HKCUdsound.reg (adds dsound registry keys needed for older games, like Max Payne)

DisableBluetooth.bat / EnableBluetooth.bat

DisableAppX.bat / EnableAppX.bat

DisableWinHTTP.bat / EnableWinHTTP.bat (borks internet if disabled)

DisableStateRepository.bat / EnableStateRepository.bat (WARNING: breaks system configuration settings, like power options) (WARNING: Breaks GUI, like taskbar, icons, and background)

run.bat

acl.txt (ACL: Access Control List - needed to take ownership of registry keys for services)

DeleteNVIDIAShaderCache.bat

PowerPlan.bat (adds duplicate power plan everytime command is executed, so use powerplan.bat only once after every new build install unless already present)

DisableServices.bat (to disable Windows Defender, run in SAFE MODE)

DisableThemes.bat / EnableThemes.bat

StartGraphicsPerfSvc.bat

PowerPlanSettings.bat (adds duplicate power plan everytime command is executed, so use powerplan.bat only once after every new build install unless already present)

RemoveWindowsFeatures.bat (windows update services required for DISM)

Internet&SecuritySettings.bat (powershell requires WMI service)

icons.bat

WingetUpdateApps.bat (winget requires Application Information service)

RemoveWindowsApps.bat (requires winget and powershell)

DisableAppInfo.bat / EnableAppInfo.bat

DisableNLA.bat / EnableNLA.bat (fixes internet)

ResetNetwork.bat

PowerPlanExtra.bat

NVCleanstall.txt

DeviceManager.txt

SetACL.bat (ACL: Access Control List - requires SetACL.exe to be in scripts directory)

InterruptAffinityPolicyTool.txt

WinInsiderUpdateChecklist.txt (to-do list when new Windows Insider build is installed)

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

DisableWinFirewall.bat / EnableWinFirewall.bat (use router firewall instead)

DisableWindowsDefender.bat (AV software is bloat, run in SAFE MODE)

StartBATs.bat (runs startup batch scripts)

DeleteFonts.bat

DisableMicrophone.bat / EnableMicrophone.bat

EnableEssentialServices.bat
