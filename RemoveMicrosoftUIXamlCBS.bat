rem # Uninstalls Microsoft UI Xaml CBS
rem # !!!WARNING!!!
rem # Borks desktop, causes screen flicker and blinking
rem # !!!WARNING!!!

PAUSE

powershell -command "Get-AppxPackage *Microsoft.UI.Xaml.CBS* | Remove-AppxPackage"

PAUSE