rem # Uninstalls Print Dialog

powershell "Get-AppPackage -Allusers *Windows.PrintDialog* | Remove-AppPackage"

PAUSE