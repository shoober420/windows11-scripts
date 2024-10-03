rem # Uninstall Microsoft Windows Cloud Experience Host (CXH)

powershell -command "Get-AppxPackage *Microsoft.Windows.CloudExperienceHost* | Remove-AppxPackage"

PAUSE