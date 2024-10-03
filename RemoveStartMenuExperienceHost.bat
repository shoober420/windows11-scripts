rem # Uninstall Windows Start Menu Experience Host

powershell -command "Get-AppxPackage *Microsoft.Windows.StartMenuExperienceHost* | Remove-AppxPackage"

PAUSE