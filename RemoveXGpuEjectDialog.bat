rem # Uninstalls XGpu Eject Dialog

powershell "Get-AppPackage -Allusers *Microsoft.Windows.XGpuEjectDialog* | Remove-AppPackage"

PAUSE