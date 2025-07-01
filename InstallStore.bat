rem # Install Microsoft Store

rem # Required for Minecraft

Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

Get-AppxPackage -allusers Microsoft.StorePurchaseApp | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

winget install 9WZDNCRFJBMP

PAUSE