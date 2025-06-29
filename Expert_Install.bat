rem # Expert Installation script
rem # Launches scripts to disable Windows Defender and other security features
rem # Launch in SAFE MODE

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