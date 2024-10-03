rem # Installs Microsoft UI Xaml CBS package
rem # Fixes constant screen flickering and blinking when package is removed

powershell -command "Get-AppxPackage *Microsoft.UI.Xaml.CBS* | Add-AppxPackage"

PAUSE