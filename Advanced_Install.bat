rem # Advanced Installation script

cd "%~dp0"

./EnablePowerShell.bat
./VCRedist.bat
./CPUTweaks.bat
./GPUTweaks.bat
./KernelTweaks.bat
./TimerTweaks.bat
./HardDrive_Tweaks.bat
./USBTweaks.bat
./HighPriority.bat
./InputTweaks.bat
./InternetSettings.bat
./SecuritySettings.bat
./DisablePerProcessSystemDPI.bat
./MouseAccelFix.bat
./NICProperties.bat
./NetworkTweaks.bat
ECHO R | powershell.exe ./DisableNetBIOS.ps1
ECHO R | powershell.exe ./DNS.ps1
./PowerPlanUltra.bat
./DisableFullscreenOptimizations.bat
ECHO R | powershell.exe ./DisableScheduledTasks.ps1
./DisableScheduledTasks.bat
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
./DisableBluetooth.bat
./DisableTouchPad.bat
./DisableSysMain.bat
./DisableEdge.bat
./DisableTPM+SecureBoot.bat
./DisableSSL+LegacyTLS.bat
./DisableBitLocker.bat
./DisableCPUMitigations.bat
./DisableMIDI2.0.bat
./RemoveFirewallRules.bat
ECHO R | powershell.exe ./DisablePowerManagement.ps1
./RAMTweaks.bat
./ThreadQuantum.bat
./UseLargePages.bat
./EnableClearPageFileAtShutdown.bat
./DisablePageFile.bat
./RemoveRemoteDesktopConnection.bat
./RemoveWindowsApps.bat
./RemoveWindowsFeatures.bat
./EnableSerializeTimerExpiration.bat
./DisableThreadDpcEnable.bat
./MaxPendingInterrupts.reg
./ResourceSets.reg
./Base+OverTargetPriorities.reg
./BCDEDIT_Tweaks.bat
./SetTimerResolution.bat
./DWM_ExclusiveModeFramerateAveragingPeriodMs.bat
./DWM_Tweaks.bat
./Windows11Tweaks.bat
./DisableServicesInternet.bat
./DisableComponents.bat
./DisableStartMenu.bat
./DisableShellExperienceHost.bat
./MTU.bat
./DeviceManager.bat
./WallpaperSolidColor.bat
./Theme.bat
./AccentColor.bat
./Decrypt+OSCompression.bat

PAUSE
