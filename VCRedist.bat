rem # Installs all VCRedist packages

rem # Requires EnableStore.bat script to run if DisableServicesWindows.bat was executed

PAUSE

rem winget --info

rem cd C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.20.1081.0_x64__8wekyb3d8bbwe

ECHO Y | winget install --id=Microsoft.VCRedist.2005.x86 -e
winget install --id=Microsoft.VCRedist.2005.x64 -e
winget install --id=Microsoft.VCRedist.2008.x86 -e
winget install --id=Microsoft.VCRedist.2008.x64 -e
winget install --id=Microsoft.VCRedist.2010.x86 -e
winget install --id=Microsoft.VCRedist.2010.x64 -e
winget install --id=Microsoft.VCRedist.2012.x86 -e
winget install --id=Microsoft.VCRedist.2012.x64 -e
winget install --id=Microsoft.VCRedist.2013.x86 -e
winget install --id=Microsoft.VCRedist.2013.x64 -e
winget install --id=Microsoft.VCRedist.2015+.x86 -e
winget install --id=Microsoft.VCRedist.2015+.x64 -e
winget install --id=Microsoft.VCRedist.2017.x86 -e
winget install --id=Microsoft.VCRedist.2017.x64 -e
winget install --id=Microsoft.VCRedist.2019.x86 -e
winget install --id=Microsoft.VCRedist.2019.x64 -e
winget install --id=Microsoft.VCRedist.2022.x86 -e
winget install --id=Microsoft.VCRedist.2022.x64 -e

PAUSE
