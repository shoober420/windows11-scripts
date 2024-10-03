rem # Uninstall Photon

powershell -command "Get-AppxPackage *MicrosoftWindows.Client.Photon* | Remove-AppxPackage"

PAUSE