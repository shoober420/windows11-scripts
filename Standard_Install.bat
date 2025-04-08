rem # Standard Installation script

cd "%~dp0"

./EnablePowerShell.bat
./VCRedist.bat
./CPUTweaks.bat
./GPUTweaks.bat
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
./DisableNetBIOS.ps1
./DNS.ps1
./PowerPlanUltra.bat
./DisableFullscreenOptimizations.bat
./DisableScheduledTasks.ps1
./DisableScheduledTasks.bat
./DisableLanmanWorkstation.bat
./DisableLanmanServer.bat
./DisableIPHelper.bat
./DisableNetBIOSHelper.bat
./DisableUPnPDeviceHost.bat
./DisableSSDPDiscovery.bat
./DisableEdge.bat
./RAMTweaks.bat
./ThreadQuantum.bat
./UseLargePages.bat
./MTU.bat
./RemoveRemoteDesktopConnection.bat
./DisableHighPrecisionEventTimer.bat

PAUSE
