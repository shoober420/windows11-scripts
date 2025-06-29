rem # Uninstalls Windows Terminal

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsTerminal* | Remove-AppxPackage"

winget uninstall terminal

PAUSE