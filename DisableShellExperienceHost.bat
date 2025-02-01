rem # Disable Shell Experience Host (to restore run "sfc /scannow")
rem # Disable Shell Infrastructure Host
takeown /s %computername% /u %username% /f "C:\Windows\System32\ShellHost.exe"
icacls "C:\Windows\System32\ShellHost.exe" /grant:r %username%:F
taskkill /im ShellHost.exe /f
rem del "C:\Windows\System32\ShellHost.exe" /s /f /q
ren "C:\Windows\System32\ShellHost.exe" "ShellHost.exe.bak"