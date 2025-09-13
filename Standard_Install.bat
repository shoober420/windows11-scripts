rem # Standard Installation script

rem # Credits:

rem # https://www.elevenforum.com/members/garlin.5387
rem # https://www.elevenforum.com/members/csmc.38355
rem # jdallmann
rem # Kizzimo
rem # foss-lover34
rem # brusk9060
rem # dersk111y
rem # V3nilla
rem # ja2forever
rem # https://www.mdgx.com
rem # https://github.com/Batleman
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
rem # https://github.com/alufena
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://admx.help
rem # https://github.com/ancel1x/Ancels-Performance-Batch
rem # https://github.com/Batlez/Batlez-Tweaks
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker
rem # https://github.com/HakanFly/Windows-Tweaks
rem # http://bbs.c3.wuyou.net/forum.php?mod=viewthread&tid=437913
rem # https://github.com/CrackedStuffEZ



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
echo 1. Above Normal Priority (RECOMMENDED)
echo 2. High Priority
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scccipsterzzz
) else if 2 EQU %ERRORLEVEL% (
   call :highp
) else if 1 EQU %ERRORLEVEL% (
   call :aboven
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:aboven
echo User chose Above Normal Priority (RECOMMENDED)

call AboveNormalPriority.bat

goto :end

:highp
echo User chose High Priority

call HighPriority.bat

goto :end

:scccipsterzzz
echo User chose SKIP

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
echo Fullscreen Optimizations (FSO)
echo.
echo 1. Enable FSO
echo 2. Disable FSO (HDR OFF)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :sccipp
) else if 2 EQU %ERRORLEVEL% (
   call :fsooff
) else if 1 EQU %ERRORLEVEL% (
   call :fsoon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:fsoon
echo User chose Enable FSO

call EnableFullscreenOptimizations.bat
cd "%~dp0"

goto :end

:fsooff
echo User chose Disable FSO (HDR OFF)

call DisableFullscreenOptimizations.bat
cd "%~dp0"

goto :end

:sccipp
echo User chose SKIP

goto :end

:end



echo.
echo 1. Vim
echo 2. Notepad++
echo 3. Classic Notepad
echo 4. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :skippy
) else if 3 EQU %ERRORLEVEL% (
   call :cnote
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
cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsVim.ps1
cd "%~dp0"

goto :end

:note
echo User chose Notepad++

call InstallNotepad++.bat
cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsNotepad++.ps1
cd "%~dp0"

goto :end

:cnote
echo User chose Classic Notepad

cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsClassicNotepad.ps1
cd "%~dp0"

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



rem # SETUP CUSTOM RESOLUTION UTILITY

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE
