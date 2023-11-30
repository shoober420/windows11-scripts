rem Enable Microsoft Store App

reg add "HKLM\SYSTEM\CurrentControlSet\Services\NcbService" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\camsvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UdkUserSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "2" /f

net start NcbService
net start AppXSvc
net start camsvc
net start UdkUserSvc
net start UnistoreSvc
net start UserDataSvc
net start InstallService
net start OneSyncSvc
net start ClipSVC
net start PushToInstall
net start cbdhsvc
net start LicenseManager
net start TokenBroker

rem Application Frame Host (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "%WinDir%\System32\ApplicationFrameHost.exe"
icacls "%WinDir%\System32\ApplicationFrameHost.exe" /grant:r %username%:F
taskkill /im ApplicationFrameHost.exe /f
rem del "%WinDir%\System32\ApplicationFrameHost.exe" /s /f /q
ren "%WinDir%\System32\ApplicationFrameHost.exe.bak" "ApplicationFrameHost.exe"

rem Search Host (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /grant:r %username%:F
taskkill /im SearchHost.exe /f
rem del "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /s /f /q
ren "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe.bak" "SearchHost.exe"

PAUSE
