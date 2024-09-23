rem # Launch Powershell Admin Command Prompt
rem # Will NOT work under SAFE MODE
rem # requires EnableRunasAdmin.bat (Secondary Logon) (will NOT work under SAFE MODE)

REM runas /user:<adminaccount> cmd

powershell start-process powershell -verb runas

PAUSE
