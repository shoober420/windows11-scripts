REM Start Batch scripts with one batch file

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main

start SetTimerResolution.bat
start StartGraphicsPerfSvc.bat
start DisableServices.bat
start DisableWinUpdate.bat

PAUSE
