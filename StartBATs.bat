REM Start Batch scripts with one batch file

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main
call SetTimerResolution.bat

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main
call StartGraphicsPerfSvc.bat

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main
call DisableServices.bat

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main
call DisableWinUpdate.bat

PAUSE
