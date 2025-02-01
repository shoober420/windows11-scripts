rem # Enable Shell Experience Host (to restore run "sfc /scannow")
rem # Enable Shell Infrastructure Host

takeown /s %computername% /u %username% /f "C:\Windows\System32\ShellHost.exe"
icacls "C:\Windows\System32\ShellHost.exe" /grant:r %username%:F
taskkill /im ShellHost.exe /f
rem del "C:\Windows\System32\ShellHost.exe" /s /f /q
ren "C:\Windows\System32\ShellHost.exe.bak" "ShellHost.exe"

PAUSE