REM Rename WindowsApps directory
takeown /s %computername% /u %username% /f "C:\Program Files\WindowsApps"
icacls "C:\Program Files\WindowsApps" /grant:r %username%:F
ren "C:\Program Files\WindowsApps" "WindowsApps.bak"
REM rmdir /s /q "C:\Program Files\WindowsApps"

PAUSE
