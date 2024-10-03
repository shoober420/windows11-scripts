rem # Uninstall Microsoft Windows Narrator Quick Start
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"

PAUSE