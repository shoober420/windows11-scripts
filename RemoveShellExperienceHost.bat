rem # Uninstall Windows Shell Experience Host

powershell -command "Get-AppxPackage *Microsoft.Windows.ShellExperienceHost* | Remove-AppxPackage"

PAUSE