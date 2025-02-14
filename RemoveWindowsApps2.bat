rem # Removes more bloat Windows apps

rem # "winget list" shows installed apps

rem # powershell -command "Get-AppxPackage | Select Name, PackageFullName" shows installed apps

rem # Add-AppxPackage installs apps

rem # Do NOT uninstall "Microsoft.UI.Xaml.CBS", causes constant screen flickering and blinking

rem # !!!WARNING!!!
rem # This script may delete Windows Apps you use, do a back up in case anything is lost you need
rem # !!!WARNING!!!

rem # EnableStore.bat required for this script to function if DisableServices.bat was executed

rem # REBOOT RECOMMENDED

PAUSE

rem # winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable PowerShell

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.CloudExperienceHost* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.PeopleExperienceHost* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.ShellExperienceHost* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.StartMenuExperienceHost* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.SecHealthUI* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Win32WebViewHost* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsAppRuntime.CBS* | Remove-AppxPackage"

powershell "Get-AppPackage -Allusers *MicrosoftWindows.Client.CBS* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.CredDialogHost* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.Windows.ParentalControls* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.XboxGameCallableUI* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.Windows.PeopleExperienceHost* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.Windows.NarratorQuickStart* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.Win32WebViewHost* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.Windows.XGpuEjectDialog* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Windows.PrintDialog* | Remove-AppPackage"

powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdge* | Remove-AppPackage"

PAUSE