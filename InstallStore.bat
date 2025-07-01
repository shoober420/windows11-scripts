rem # Install Microsoft Store

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Add-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.StorePurchaseApp* | Add-AppxPackage"

PAUSE