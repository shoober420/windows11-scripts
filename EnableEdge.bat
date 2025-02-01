rem # Enable Microsoft Edge (to restore run "sfc /scannow")

takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
icacls "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" /grant:r %username%:F
taskkill /im msedge.exe /f
rem del "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" /s /f /q
ren "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe.bak" "msedge.exe"

PAUSE