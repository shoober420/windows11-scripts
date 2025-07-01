rem # Remove Microsoft Store

rem # !!! WARNING !!!

rem # BREAKS MINECRAFT

rem # !!! WARNING !!!

PAUSE

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.StorePurchaseApp* | Remove-AppxPackage"

PAUSE