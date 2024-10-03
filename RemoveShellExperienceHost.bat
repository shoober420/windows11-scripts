rem # Uninstall Windows Shell Experience Host
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.Windows.ShellExperienceHost* | Remove-AppxPackage"

PAUSE