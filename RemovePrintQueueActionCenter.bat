rem # Uninstall Print Queue Action Center

powershell -command "Get-AppxPackage *Microsoft.Windows.PrintQueueActionCenter* | Remove-AppxPackage"

PAUSE