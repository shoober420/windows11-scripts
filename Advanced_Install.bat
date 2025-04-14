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

call EnablePowerShell.bat
cd "%~dp0"

call EnableTLS1.2.bat
cd "%~dp0"

call VCRedist.bat
cd "%~dp0"

call CPUTweaks.bat
cd "%~dp0"

call GPUTweaks.bat
cd "%~dp0"

call KernelTweaks.bat
cd "%~dp0"

call TimerTweaks.bat
cd "%~dp0"

call HardDrive_Tweaks.bat
cd "%~dp0"

call USBTweaks.bat
cd "%~dp0"

rem call HighPriority.bat
cd "%~dp0"

call InputTweaks.bat
cd "%~dp0"

call InternetSettings.bat
cd "%~dp0"

call SecuritySettings.bat
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

call DisableSysMain.bat
cd "%~dp0"

call DisableEdge.bat
cd "%~dp0"

call DisableMIDI2.0.bat
cd "%~dp0"

call RemoveFirewallRules.bat
cd "%~dp0"

call RAMTweaks.bat
cd "%~dp0"

call ThreadQuantum.bat
cd "%~dp0"

call UseLargePages.bat
cd "%~dp0"

call EnableClearPageFileAtShutdown.bat
cd "%~dp0"

call DisablePageFile.bat
cd "%~dp0"

call RemoveRemoteDesktopConnection.bat
cd "%~dp0"

call RemoveWindowsApps.bat
cd "%~dp0"

call RemoveWindowsFeatures.bat
cd "%~dp0"

call EnableSerializeTimerExpiration.bat
cd "%~dp0"

call DisableThreadDpcEnable.bat
cd "%~dp0"

regedit.exe "%~dp0\MaxPendingInterrupts.reg"
cd "%~dp0"

regedit.exe "%~dp0\ResourceSets.reg"
cd "%~dp0"

regedit.exe "%~dp0\Base+OverTargetPriorities.reg"
cd "%~dp0"

call BCDEDIT_Tweaks.bat
cd "%~dp0"

call SetTimerResolution.bat
cd "%~dp0"

call DWM_ExclusiveModeFramerateAveragingPeriodMs.bat

cd "%~dp0"

call DWM_Tweaks.bat
cd "%~dp0"

call DisableServicesInternet.bat

cd "%~dp0"

call DisableComponents.bat
cd "%~dp0"

call DisableStartMenu.bat
cd "%~dp0"

call DisableShellExperienceHost.bat
cd "%~dp0"

call MTU.bat
cd "%~dp0"

call DeviceManager.bat
cd "%~dp0"

call WallpaperSolidColor.bat
cd "%~dp0"

call Theme.bat

cd "%~dp0"

call AccentColor.bat
cd "%~dp0"

call NetworkTweaks.bat

cd "%~dp0"

call Windows11Tweaks.bat

cd "%~dp0"

call DisableSSL+LegacyTLS.bat
cd "%~dp0"

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
)

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
)

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
)

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
)

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
echo 1. Static IP Connection
echo 2. DHCP Connection
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
)

goto :eof

:DHCPON
echo User chose DHCP Connection

goto :end

:STATICON
echo User chose Static IP Connection

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
echo 1. CPU Mitigations ENABLED
echo 2. CPU Mitigations DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :CPUOFF
) else if 1 EQU %ERRORLEVEL% (
   call :CPUON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:CPUOFF
echo User chose CPU Mitigations DISABLED

call DisableCPUMitigations.bat

goto :end

:CPUON
echo User chose CPU Mitigations ENABLED

call EnableCPUMitigations.bat

goto :end

:end

echo.
echo 1. TouchPad ENABLED
echo 2. TouchPad DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :TPOFF
) else if 1 EQU %ERRORLEVEL% (
   call :TPON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:TPOFF
echo User chose TouchPad DISABLED

call DisableTouchPad.bat

goto :end

:TPON
echo User chose TouchPad ENABLED

call EnableTouchPad.bat

goto :end

:end

cd "%~dp0"

ECHO R | powershell.exe ./DisableNetBIOS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DNS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisableScheduledTasks.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisablePowerManagement.ps1

cd "%~dp0"

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE
