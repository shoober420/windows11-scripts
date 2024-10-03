rem # Uninstall Microsoft Xbox Game Callable UI

powershell -command "Get-AppxPackage *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"

PAUSE