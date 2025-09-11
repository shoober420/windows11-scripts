rem # Start Up Batch script

rem # Disables re-enabled services launched after sign in

rem # RECOMMENDED TO LAUNCH ON EXPERT INSTALL

rem # Executes SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

PAUSE

cd %USERPROFILE%\Downloads\windows11-scripts-main
rem call SetTimerResolution.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableServicesInternet.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableServicesWindows.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableWindowsUpdate.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableSENS.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableAppX.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableWindowsConnectionManager.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DWM_ExclusiveModeFramerateAveragingPeriodMs.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableUI.bat



@echo off


echo.
echo GraphicsPerfSvc
echo.
echo 1. GraphicsPerfSvc: ON (REQUIRED FOR GPU SCHEDULING AND DLSS)
echo 2. GraphicsPerfSvc: OFF
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :gfxoff
) else if 1 EQU %ERRORLEVEL% (
   call :gfxon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:gfxon
echo User chose GraphicsPerfSvc: ON (REQUIRED FOR GPU SCHEDULING AND DLSS)

cd %USERPROFILE%\Downloads\windows11-scripts-main
call StartGraphicsPerfSvc.bat

goto :end

:gfxoff
echo User chose GraphicsPerfSvc: OFF

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableGraphicsPerfSvc.bat

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



echo.
echo 1. Enable Microphone
echo 2. Disable Microphone
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scypppz
) else if 2 EQU %ERRORLEVEL% (
   call :micoff
) else if 1 EQU %ERRORLEVEL% (
   call :micon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:micon
echo User chose Enable Microphone

cd %USERPROFILE%\Downloads\windows11-scripts-main
call EnableMicrophone.bat

goto :end

:micoff
echo User chose Disable Microphone

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableMicrophone.bat

goto :end

:scypppz
echo User chose SKIP

goto :end

:end



cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableWMI.bat

PAUSE
