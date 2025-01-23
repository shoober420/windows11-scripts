rem # Uninstalls Cred Dialog Host

powershell "Get-AppPackage -Allusers *Microsoft.CredDialogHost* | Remove-AppPackage"

PAUSE