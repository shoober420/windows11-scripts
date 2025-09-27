rem # SystemApps (UWP apps)



@echo off



echo.
echo UWP Apps (SystemApps)
echo.
echo 1. Disable UWP Apps
echo 2. Enable UWP Apps
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :zkepp
) else if 2 EQU %ERRORLEVEL% (
   call :uwpon
) else if 1 EQU %ERRORLEVEL% (
   call :uwpoff
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:uwpoff
echo User chose Disable UWP Apps

rem # Disable UWP apps
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps"
icacls "C:\Windows\SystemApps" /grant:r %username%:F
rem del "C:\Windows\SystemApps" /s /f /q
ren "C:\Windows\SystemApps" "SystemAppsbak"

goto :end

:uwpon
echo User chose Enable UWP Apps

rem # Enable UWP apps
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps"
icacls "C:\Windows\SystemApps" /grant:r %username%:F
rem del "C:\Windows\SystemApps" /s /f /q
ren "C:\Windows\SystemAppsbak" "SystemApps"

goto :end

:zkepp
echo User chose SKIP

goto :end

:end

PAUSE