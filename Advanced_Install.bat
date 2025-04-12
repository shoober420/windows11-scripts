rem # Advanced Installation script

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

< NUL call EnablePowerShell.bat
< NUL call VCRedist.bat
< NUL call CPUTweaks.bat
< NUL call GPUTweaks.bat
< NUL call KernelTweaks.bat
< NUL call TimerTweaks.bat
< NUL call HardDrive_Tweaks.bat
< NUL call USBTweaks.bat
rem < NUL call HighPriority.bat
< NUL call InputTweaks.bat
< NUL call InternetSettings.bat
< NUL call SecuritySettings.bat
< NUL call DisablePerProcessSystemDPI.bat
< NUL call MouseAccelFix.bat
< NUL call NICProperties.bat
< NUL call PowerPlanUltra.bat
< NUL call DisableFullscreenOptimizations.bat
< NUL call DisableScheduledTasks.bat
< NUL call DisableTouchPad.bat
< NUL call DisableSysMain.bat
< NUL call DisableEdge.bat
< NUL call DisableSSL+LegacyTLS.bat
< NUL call DisableCPUMitigations.bat
< NUL call DisableMIDI2.0.bat
< NUL call RemoveFirewallRules.bat
call RAMTweaks.bat
call ThreadQuantum.bat
< NUL call UseLargePages.bat
< NUL call EnableClearPageFileAtShutdown.bat
< NUL call DisablePageFile.bat
< NUL call RemoveRemoteDesktopConnection.bat
< NUL call RemoveWindowsApps.bat
< NUL call RemoveWindowsFeatures.bat
< NUL call EnableSerializeTimerExpiration.bat
< NUL call DisableThreadDpcEnable.bat
regedit.exe /s MaxPendingInterrupts.reg
regedit.exe /s ResourceSets.reg
regedit.exe /s Base+OverTargetPriorities.reg
< NUL call BCDEDIT_Tweaks.bat
< NUL call SetTimerResolution.bat
< NUL call DWM_ExclusiveModeFramerateAveragingPeriodMs.bat
< NUL call DWM_Tweaks.bat
< NUL call DisableServicesInternet.bat
< NUL call DisableComponents.bat
< NUL call DisableStartMenu.bat
< NUL call DisableShellExperienceHost.bat
< NUL call MTU.bat
< NUL call DeviceManager.bat
call WallpaperSolidColor.bat
< NUL call Theme.bat
call AccentColor.bat

< NUL call NetworkTweaks.bat

cd "%~dp0"

< NUL call Windows11Tweaks.bat

cd "%~dp0"

ECHO R | powershell.exe ./DisableNetBIOS.ps1
ECHO R | powershell.exe ./DNS.ps1
ECHO R | powershell.exe ./DisableScheduledTasks.ps1
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
ECHO R | powershell.exe ./DisablePowerManagement.ps1

@echo off

echo.
echo 1. HDR ENABLED
echo 2. HDR DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :HDROFF
) else if 1 EQU %ERRORLEVEL% (
   call :HDRON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.

goto :eof

:HDRON
echo User chose HDR ENABLED

call EnableHDR.bat

goto :end

:HDROFF
echo User chose HDR DISABLED

call DisableHDR.bat

goto :end

:end

echo.
echo 1. BLUETOOTH ENABLED
echo 2. BLUETOOTH DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :BTOFF
) else if 1 EQU %ERRORLEVEL% (
   call :BTON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.

goto :eof

:BTON
echo User chose BLUETOOTH ENABLED

call EnableBluetooth.bat

goto :end

:BTOFF
echo User chose BLUETOOTH DISABLED

call DisableBluetooth.bat

goto :end

:end

echo.
echo 1. TPM + BitLocker ENABLED
echo 2. TPM + BitLocker DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :TPMOFF
) else if 1 EQU %ERRORLEVEL% (
   call :TPMON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.

goto :eof

:TPMON
echo User chose TPM ENABLED

goto :end

:TPMOFF
echo User chose TPM DISABLED

call DisableTPM+SecureBoot.bat
call DisableBitLocker.bat
call Decrypt+OSCompression.bat

goto :end

:end

echo.
echo 1. Windows Services ENABLED
echo 2. Windows Services DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :SVCOFF
) else if 1 EQU %ERRORLEVEL% (
   call :SVCON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.

goto :eof

:SVCON
echo User chose Windows Services ENABLED

goto :end

:SVCOFF
echo User chose Windows Services DISABLED

call DisableServicesWindows.bat

goto :end

:end

echo.
echo 1. Static IP ENABLED
echo 2. DHCP ENABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :DHCPON
) else if 1 EQU %ERRORLEVEL% (
   call :STATICON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.

goto :eof

:DHCPON
echo User chose DHCP ENABLED

goto :end

:STATICON
echo User chose Static IP ENABLED

call DisableDHCP.bat
call StaticIPConnection.bat
call DisableWinHTTP.bat
call DisableWLAN_AutoConfig.bat

goto :end

:end

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

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE
