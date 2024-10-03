rem # Uninstall Capture Picker

powershell -command "Get-AppxPackage *Microsoft.Windows.CapturePicker* | Remove-AppxPackage"

PAUSE