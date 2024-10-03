rem # Uninstall Microsoft Windows Content Delivery Manager

powershell -command "Get-AppxPackage *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"

PAUSE