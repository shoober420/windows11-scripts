rem # Enable DWM

rem # Disabling Shell Infrastructure Host (sihost.exe) makes system much slower

rem # https://youtu.be/K_4i6X5OAw8
rem # https://youtu.be/1iXfUThaQ1Q
rem # https://youtu.be/j6_GXujgM3Y

rem # Restore dwm.exe (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\System32\dwm.exe"
icacls "C:\Windows\System32\dwm.exe" /grant:r %username%:F
taskkill /im dwm.exe /f
del "C:\Windows\System32\dwm.exe" /s /f /q
ren "C:\Windows\System32\dwm.exe.bak" "dwm.exe"

rem # Fix Black screen at login
takeown /s %computername% /u %username% /f "C:\Windows\System32\Windows.UI.logon.dll"
icacls "C:\Windows\System32\Windows.UI.logon.dll" /grant:r %username%:F
rem taskkill /im Windows.UI.logon.dll /f
rem del "C:\Windows\System32\Windows.UI.logon.dll" /s /f /q
ren "C:\Windows\System32\Windows.UI.logon.dll.bak" "Windows.UI.logon.dll"

rem # Fix Mouse
takeown /s %computername% /u %username% /f "C:\Windows\System32\DWMInit.dll"
icacls "C:\Windows\System32\DWMInit.dll" /grant:r %username%:F
rem taskkill /im DWMInit.dll /f
rem del "C:\Windows\System32\DWMInit.dll" /s /f /q
ren "C:\Windows\System32\DWMInit.dll.bak" "DWMInit.dll"

rem # Enable UWP apps
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps"
icacls "C:\Windows\SystemApps" /grant:r %username%:F
rem del "C:\Windows\SystemApps" /s /f /q
ren "C:\Windows\SystemAppsbak" "SystemApps"

cd "%~dp0"

call EnableShellInfrastructureHost.bat

cd "%~dp0"

PAUSE

