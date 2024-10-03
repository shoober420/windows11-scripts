rem # Uninstall Microsoft Windows Content Delivery Manager
rem # Requires SAFE MODE

PAUSE

powershell -command "Get-AppxPackage *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"

PAUSE