rem # Uninstall Windows Client CBS

powershell "Get-AppPackage -Allusers *MicrosoftWindows.Client.CBS* | Remove-AppPackage"

PAUSE