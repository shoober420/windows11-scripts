rem Remove bloat windows apps

rem winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
net start Appinfo

winget uninstall Microsoft.OneDrive
winget uninstall Microsoft.WindowsCamera
winget uninstall Microsoft.GetHelp
winget uninstall Microsoft.People
winget uninstall Microsoft.Windows.PeopleExperienceHost
winget uninstall Microsoft.Windows.CloudExperienceHost
winget uninstall Microsoft.549981C3F5F10
winget uninstall Microsoft.Windows.Photos
winget uninstall Microsoft.YourPhone
winget uninstall Microsoft.XboxGameOverlay
winget uninstall Microsoft.XboxGamingOverlay
winget uninstall Microsoft.XboxIdentityProvider
winget uninstall Microsoft.XboxSpeechToTextOverlay
winget uninstall Microsoft.XboxGameCallableUI
winget uninstall Microsoft.MicrosoftEdge
winget uninstall Microsoft.MicrosoftEdgeBeta
winget uninstall Microsoft.MicrosoftEdgeStable
winget uninstall Microsoft.MicrosoftEdgeDevToolsClient
winget uninstall Microsoft.GamingServices
winget uninstall MicrosoftWindows.Client.WebExperience
winget uninstall Microsoft.Windows.ShellExperienceHost
winget uninstall Microsoft.Windows.StartMenuExperienceHost
winget uninstall "windows web experience pack"

rem Disable "Application Information" service
net stop Appinfo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
