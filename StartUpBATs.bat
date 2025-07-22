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
call DisableWMI.bat



@echo off


echo.
echo GraphicsPerfSvc
echo.
echo 1. GraphicsPerfSvc: ON (REQUIRED FOR HAGS AND DLSS)
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
echo User chose GraphicsPerfSvc: ON (REQUIRED FOR HAGS AND DLSS)

cd %USERPROFILE%\Downloads\windows11-scripts-main
call StartGraphicsPerfSvc.bat

goto :end

:gfxoff
echo User chose GraphicsPerfSvc: OFF

goto :end

:end

PAUSE
