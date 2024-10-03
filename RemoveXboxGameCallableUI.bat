rem # Uninstall Microsoft Xbox Game Callable UI
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"

PAUSE