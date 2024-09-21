rem # Installs Winget through CLI

powershell $progressPreference = 'silentlyContinue'
powershell Write-Information "Downloading WinGet and its dependencies..."
powershell Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
powershell Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
powershell Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
powershell Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
powershell Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
powershell Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

PAUSE