rem # Uninstall Microsoft Windows Cloud Experience Host (CXH)
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.Windows.CloudExperienceHost* | Remove-AppxPackage"

PAUSE