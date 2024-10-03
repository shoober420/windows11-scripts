rem # Uninstall Microsoft Windows Narrator Quick Start

powershell -command "Get-AppxPackage *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"

PAUSE