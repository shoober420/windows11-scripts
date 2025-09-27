rem # Disable DWM

rem # Disabling Shell Infrastructure Host (sihost.exe) makes system much slower

rem # https://youtu.be/K_4i6X5OAw8
rem # https://youtu.be/1iXfUThaQ1Q
rem # https://youtu.be/j6_GXujgM3Y

rem # Backup dwm.exe (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\System32\dwm.exe"
icacls "C:\Windows\System32\dwm.exe" /grant:r %username%:F
rem taskkill /im dwm.exe /f
rem del "C:\Windows\System32\dwm.exe" /s /f /q
ren "C:\Windows\System32\dwm.exe" "dwm.exe.bak"

copy "C:\Windows\System32\cmd.exe" "C:\Windows\System32\dwm.exe"

rem # Fix Black Screen at Login
takeown /s %computername% /u %username% /f "C:\Windows\System32\Windows.UI.logon.dll"
icacls "C:\Windows\System32\Windows.UI.logon.dll" /grant:r %username%:F
rem taskkill /im Windows.UI.logon.dll /f
rem del "C:\Windows\System32\Windows.UI.logon.dll" /s /f /q
ren "C:\Windows\System32\Windows.UI.logon.dll" "Windows.UI.logon.dll.bak"

rem # Fix Mouse
takeown /s %computername% /u %username% /f "C:\Windows\System32\DWMInit.dll"
icacls "C:\Windows\System32\DWMInit.dll" /grant:r %username%:F
rem taskkill /im DWMInit.dll /f
rem del "C:\Windows\System32\DWMInit.dll" /s /f /q
ren "C:\Windows\System32\DWMInit.dll" "DWMInit.dll.bak"

@echo off



echo.
echo UWP Apps (SystemApps)
echo.
echo 1. Disable UWP Apps
echo 2. Enable UWP Apps
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :frtcoff
) else if 1 EQU %ERRORLEVEL% (
   call :fr
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:frtcon
echo User chose FRTC ON

rem # Disable UWP apps
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps"
icacls "C:\Windows\SystemApps" /grant:r %username%:F
rem del "C:\Windows\SystemApps" /s /f /q
ren "C:\Windows\SystemApps" "SystemAppsbak"

rem # Disable Resources
rem # Enable Classic Theme
takeown /s %computername% /u %username% /f "C:\Windows\Resources"
icacls "C:\Windows\Resources" /grant:r %username%:F
rem del "C:\Windows\Resources" /s /f /q
ren "C:\Windows\Resources" "Resourcesbak"

cd "%~dp0"

call DisableShellInfrastructureHost.bat

cd "%~dp0"

PAUSE