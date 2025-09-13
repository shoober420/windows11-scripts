rem # Expert Installation script

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



rem # Launches scripts to disable Windows Defender and other security features

rem # Recommended to launch in SAFE MODE

PAUSE

cd "%~dp0"

call SetACL.bat
cd "%~dp0"

call DisableWindowsDefender.bat
cd "%~dp0"

call DisableWindowsFirewall.bat
cd "%~dp0"

call DisableWindowsSecurityCenter.bat
cd "%~dp0"

call DisableEventTraceSessions.bat
cd "%~dp0"

call DisableSAM.bat
cd "%~dp0"

call DisableLanmanServer.bat
cd "%~dp0"

call DisableStartMenu.bat
cd "%~dp0"

call DisableComponents.bat
cd "%~dp0"

call DisableWindowsSearch.bat
cd "%~dp0"

call DeleteFonts.bat
cd "%~dp0"

call DisableServicesIntel.bat
cd "%~dp0"

call DisableServicesAMD.bat
cd "%~dp0"

call Windows11Tweaks.bat
cd "%~dp0"



@echo off



echo.
echo 1. Enable NULL service
echo 2. Disable NULL service (breaks Discord and Android Debug Bridge) 
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :dnull
) else if 1 EQU %ERRORLEVEL% (
   call :enull
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:enull
echo User chose Enable NULL service

call EnableNull.bat

goto :end

:dnull
echo User chose Disable NULL service (breaks Discord and Android Debug Bridge)

call DisableNull.bat

goto :end

:end



echo.
echo 1. Enable AMD External Events Utility service
echo 2. Disable AMD External Events Utility service (Locks FPS to monitor refresh rate in some games)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scyp
) else if 2 EQU %ERRORLEVEL% (
   call :amdexf
) else if 1 EQU %ERRORLEVEL% (
   call :amdexo
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:amdexo
echo User chose Enable AMD External Events Utility service

rem # Enable AMD External Events Utility
rem # V3nilla
rem # https://github.com/shoober420/windows11-scripts/issues/14

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "2" /f

net start "AMD External Events Utility"

goto :end

:amdexf
echo User chose Disable AMD External Events Utility service (Locks FPS to monitor refresh rate in some games)

rem # Disable AMD External Events Utility
rem # V3nilla
rem # https://github.com/shoober420/windows11-scripts/issues/14

rem # !!! WARNING !!!

rem # Locks FPS to monitor refresh rate for some games

rem # !!! WARNING !!!

net stop "AMD External Events Utility"

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f

goto :end

:scyp
echo User chose SKIP

goto :end

:end



PAUSE

rem # SETUP CUSTOM RESOLUTION UTILITY

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat