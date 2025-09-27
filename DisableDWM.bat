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

call SystemApps.bat

call ClassicTheme.bat



echo.
echo Shell Infrastructure Host (sihost.exe)
echo.
echo 1. Disable Shell Infrastructure Host (sihost.exe)
echo 2. Enable Shell Infrastructure Host (sihost.exe)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :zkepppp
) else if 2 EQU %ERRORLEVEL% (
   call :sion
) else if 1 EQU %ERRORLEVEL% (
   call :sioff
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:sioff
echo User chose Disable Shell Infrastructure Host (sihost.exe)

cd "%~dp0"
call DisableShellInfrastructureHost.bat

goto :end

:sion
echo User chose Enable Shell Infrastructure Host (sihost.exe)

cd "%~dp0"
call EnableShellInfrastructureHost.bat

goto :end

:zkepppp
echo User chose SKIP

goto :end

:end

PAUSE