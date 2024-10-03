rem # Uninstall Microsoft Security Health UI
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.SecHealthUI* | Remove-AppxPackage"

PAUSE