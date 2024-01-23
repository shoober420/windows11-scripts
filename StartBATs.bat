REM Start Batch scripts with one batch file

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main

call SetTimerResolution.bat
call StartGraphicsPerfSvc.bat
call DisableServices.bat
call DisableWinUpdate.bat

PAUSE
