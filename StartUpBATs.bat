REM Start Up Batch script
REM Highly recommended to run after login
REM Executes SetTimerResolution.exe
REM Disables services launched after signing in

cd %USERPROFILE%\Downloads\windows11-scripts-main
call SetTimerResolution.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call StartGraphicsPerfSvc.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableServices.bat

cd %USERPROFILE%\Downloads\windows11-scripts-main
call DisableWindowsUpdate.bat

PAUSE
