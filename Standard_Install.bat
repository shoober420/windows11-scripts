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

call EnablePowerShell.bat
cd "%~dp0"

call EnableTLS1.2.bat
cd "%~dp0"

call VCRedist.bat
cd "%~dp0"

call WingetUpdateApps.bat
cd "%~dp0"

call CPUTweaks.bat
cd "%~dp0"

call GPUTweaks.bat
cd "%~dp0"

call HardDrive_Tweaks.bat
cd "%~dp0"

call USBTweaks.bat
cd "%~dp0"

call AboveNormalPriority.bat
cd "%~dp0"

call InputTweaks.bat
cd "%~dp0"

call InternetSettings.bat
cd "%~dp0"

call DisablePerProcessSystemDPI.bat
cd "%~dp0"

call MouseAccelFix.bat
cd "%~dp0"

call NICProperties.bat
cd "%~dp0"

call PowerPlanUltra.bat
cd "%~dp0"

call DisableFullscreenOptimizations.bat
cd "%~dp0"

call DisableScheduledTasks.bat
cd "%~dp0"

call DisableLanmanWorkstation.bat
cd "%~dp0"

call DisableLanmanServer.bat
cd "%~dp0"

call DisableIPHelper.bat
cd "%~dp0"

call DisableNetBIOSHelper.bat
cd "%~dp0"

call DisableUPnPDeviceHost.bat
cd "%~dp0"

call DisableSSDPDiscovery.bat
cd "%~dp0"

call DisableEdge.bat
cd "%~dp0"

call RAMTweaks.bat
cd "%~dp0"

call ThreadQuantum.bat
cd "%~dp0"

call UseLargePages.bat
cd "%~dp0"

call MTU.bat
cd "%~dp0"

call RemoveRemoteDesktopConnection.bat
cd "%~dp0"

call DisableHighPrecisionEventTimer.bat
cd "%~dp0"

call NetworkTweaks.bat

cd "%~dp0"

@echo off

echo.
echo 1. NVIDIA GPU
echo 2. AMD GPU
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :AMD
) else if 1 EQU %ERRORLEVEL% (
   call :NV
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:AMD
echo User chose AMD GPU

call AMDGPUTweaks.bat

goto :end

:NV
echo User chose NVIDIA GPU

call NVGPUTweaks.bat

goto :end

:end

echo.
echo 1. Vim
echo 2. Notepad++
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skippy
) else if 2 EQU %ERRORLEVEL% (
   call :note
) else if 1 EQU %ERRORLEVEL% (
   call :vim
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:vim
echo User chose Vim

call InstallVim.bat

goto :end

:vim
echo User chose Notepad++

call InstallNotepad++.bat

goto :end

:skippy
echo User chose SKIP

goto :end

:end



cd "%~dp0"

ECHO R | powershell.exe ./DisableNetBIOS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DNS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisableScheduledTasks.ps1

cd "%~dp0"



rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE
