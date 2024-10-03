rem # Uninstall Parental Controls

powershell -command "Get-AppxPackage *Microsoft.Windows.ParentalControls* | Remove-AppxPackage"

PAUSE