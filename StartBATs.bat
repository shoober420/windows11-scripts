REM Start Batch scripts with one batch file

cd %USERPROFILE%\Downloads\windows11-batch-scripts-main

./SetTimerResolution.bat
./StartGraphicsPerfSvc.bat
./DisableServices.bat
./DisableWinUpdate.bat

PAUSE
