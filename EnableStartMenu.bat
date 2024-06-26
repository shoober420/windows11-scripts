rem # Enable Start Menu

rem # Enable Shell Experience Host (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe"
icacls "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe" /grant:r %username%:F
taskkill /im ShellExperienceHost.exe /f
rem del "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe" /s /f /q
ren "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe.bak" "ShellExperienceHost.exe"

rem # Enable Start (to restore run SFC scan)
takeown /s %computername% /u %username% /f "%WINDIR%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe"
icacls "%WINDIR%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /inheritance:r /grant:r %username%:F
taskkill /im StartMenuExperienceHost.exe /f
rem del "%WINDIR%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /s /f /q
ren "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe.bak" "StartMenuExperienceHost.exe"

PAUSE
