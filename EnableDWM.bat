rem # Enable DWM

rem # Restore dwm.exe (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\System32\dwm.exe"
icacls "C:\Windows\System32\dwm.exe" /grant:r %username%:F
taskkill /im dwm.exe /f
del "C:\Windows\System32\dwm.exe" /s /f /q
ren "C:\Windows\System32\dwm.exe.bak" "dwm.exe"



takeown /s %computername% /u %username% /f "C:\Windows\System32\Windows.UI.logon.dll"
icacls "C:\Windows\System32\Windows.UI.logon.dll" /grant:r %username%:F
rem taskkill /im Windows.UI.logon.dll /f
rem del "C:\Windows\System32\Windows.UI.logon.dll" /s /f /q
ren "C:\Windows\System32\Windows.UI.logon.dll.bak" "Windows.UI.logon.dll"

cd "%~dp0"

call EnableShellInfrastructureHost.bat

cd "%~dp0"

PAUSE

