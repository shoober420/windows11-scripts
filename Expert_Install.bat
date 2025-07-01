rem # Expert Installation script

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

@echo off

echo.
echo 1. Install Microsoft Store
echo 2. Remove Microsoft Store (BREAKS MINECRAFT)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skippert
) else if 2 EQU %ERRORLEVEL% (
   call :ustore
) else if 1 EQU %ERRORLEVEL% (
   call :istore
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:istore
echo User chose Install Microsoft Store

call InstallStore.bat

goto :end

:ustore
echo User chose Remove Microsoft Store

call RemoveStore.bat

goto :end

:skippert
echo User chose SKIP

goto :end

:end



echo.
echo 1. Enable AMDGPU: DalDramClockChangeLatencyNs tweak
echo 2. SKIP
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :skipsters
) else if 1 EQU %ERRORLEVEL% (
   call :amddaldram
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:amddaldram
echo User chose Enable AMDGPU: DalDramClockChangeLatencyNs tweak

call EnableAMDGPU_DalDramClockChangeLatencyNs.bat

goto :end

:skipsters
echo User chose SKIP

goto :end

:end



echo.
echo 1. Uninstall Windows Terminal
echo 2. SKIP
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :skipster
) else if 1 EQU %ERRORLEVEL% (
   call :delterm
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:delterm
echo User chose Uninstall Windows Terminal

call RemoveWindowsTerminal.bat

goto :end

:skipster
echo User chose SKIP

goto :end

:end



PAUSE