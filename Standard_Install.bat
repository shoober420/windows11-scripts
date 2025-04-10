rem # Standard Installation script

rem # Credits:

rem # https://www.elevenforum.com/members/garlin.5387
rem # https://www.elevenforum.com/members/csmc.38355
rem # jdallmann
rem # Kizzimo
rem # foss-lover34
rem # https://github.com/AlchemyTweaks
rem # https://github.com/TairikuOokami
rem # https://github.com/ionuttbara
rem # https://github.com/Hyyote
rem # https://github.com/MoriEdan
rem # https://github.com/NicholasBly
rem # https://github.com/rahilpathan
rem # https://github.com/ChrisTitusTech
rem # https://github.com/raspi
rem # https://github.com/simeononsecurity
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://admx.help
rem # https://github.com/ancel1x/Ancels-Performance-Batch
rem # https://github.com/Batlez/Batlez-Tweaks
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker
rem # https://github.com/HakanFly/Windows-Tweaks

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
ECHO R | powershell.exe ./DisableNetBIOS.ps1
ECHO R | powershell.exe ./DNS.ps1
./PowerPlanUltra.bat
./DisableFullscreenOptimizations.bat
ECHO R | powershell.exe ./DisableScheduledTasks.ps1
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

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem #
NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE
