rem # Disable Microsoft Edge (to restore run "sfc /scannow")

takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
icacls "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" /grant:r %username%:F
taskkill /im msedge.exe /f
rem del "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" /s /f /q
ren "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "msedge.exe.bak"

rem # Remove Microsoft Edge
takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\Edge"
takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\EdgeCore"
takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\EdgeUpdate"
takeown /s %computername% /u %username% /f "C:\Program Files (x86)\Microsoft\EdgeWebView"
icacls "C:\Program Files (x86)\Microsoft\Edge" /grant:r %username%:F
icacls "C:\Program Files (x86)\Microsoft\EdgeCore" /grant:r %username%:F
icacls "C:\Program Files (x86)\Microsoft\EdgeUpdate" /grant:r %username%:F
icacls "C:\Program Files (x86)\Microsoft\EdgeWebView" /grant:r %username%:F
taskkill /im MicrosoftEdgeUpdate.exe /f
taskkill /im EdgeUpdate.exe /f
ren "C:\Program Files (x86)\Microsoft\Edge" "Edge.bak"
ren "C:\Program Files (x86)\Microsoft\EdgeCore" "EdgeCore.bak"
ren "C:\Program Files (x86)\Microsoft\EdgeUpdate" "EdgeUpdate.bak"
ren "C:\Program Files (x86)\Microsoft\EdgeWebView" "EdgeWebView.bak"

rem # Disable Microsoft Edge
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
icacls "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant:r %username%:F
taskkill /im msedge.exe /f
rem del "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /s /f /q
ren "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" "Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe.bak"

PAUSE