rem # Enable Shell Infrastructure Host

takeown /s %computername% /u %username% /f "C:\Windows\System32\sihost.exe"
icacls "C:\Windows\System32\sihost.exe" /grant:r %username%:F
taskkill /im sihost.exe /f
rem del "C:\Windows\System32\sihost.exe" /s /f /q
ren "C:\Windows\System32\sihost.exe.bak" "sihost.exe"

PAUSE