rem # Remove all Windows apps

rem # DONT UNINSTALL "Microsoft.UI.Xaml.CBS", causes constant desktop refresh flicker
rem powershell "Get-AppxPackage | Remove-AppxPackage"

rem # !!! WARNING !!!
rem # Removes certain user installed apps (not Steam)
rem # Do a backup incase anything of value is lost
rem # !!! WARNING !!!

PAUSE

rem # Find and Remove for all existing user packages
rem powershell "Get-AppxPackage -AllUsers | Remove-AppxPackage"

rem # Find, remove, and nevercomeback for every User and every future User on this computer
rem powershell "Get-AppxProvisionedPackage -online | Remove-AppxProvisionedPackage -online"

rem # Remove all other apps except Microsoft Store
rem powershell -command "Get-AppXPackage | where-object {$_.name -notlike '*store*'} | Remove-AppxPackage"

rem # Remove all apps except "Microsoft.UI.Xaml.CBS"
powershell -command "Get-AppXPackage | where-object {$_.name -notlike '*Microsoft.UI.Xaml.CBS*'} | Remove-AppxPackage"

rem # Remove all apps for every user but keep "Microsoft.UI.Xaml.CBS"
powershell -command "Get-AppXPackage -AllUsers | where-object {$_.name -notlike '*Microsoft.UI.Xaml.CBS*'} | Remove-AppxPackage"

PAUSE