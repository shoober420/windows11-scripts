rem # Uninstall Windows App Runtime

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsAppRuntime.CBS* | Remove-AppxPackage"

PAUSE