rem # Uninstall Win32 WebView Host

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Win32WebViewHost* | Remove-AppxPackage"

PAUSE