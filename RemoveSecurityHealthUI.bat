rem # Uninstall Microsoft Security Health UI

powershell -command "Get-AppxPackage *Microsoft.SecHealthUI* | Remove-AppxPackage"

PAUSE