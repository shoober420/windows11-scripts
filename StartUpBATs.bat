rem # Start Up Batch script

rem # Disables re-enabled services launched after sign in

rem # RECOMMENDED TO LAUNCH ON EXPERT INSTALL

rem # Executes SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

PAUSE

cd %USERPROFILE%\Downloads\windows11-scripts-main
call SetTimerResolution.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call StartGraphicsPerfSvc.bat

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

PAUSE
