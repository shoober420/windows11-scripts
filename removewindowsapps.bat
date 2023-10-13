rem Remove bloat windows apps

rem winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
net start Appinfo

winget uninstall onedrive
winget uninstall camera
winget uninstall help
rem winget uninstall Microsoft.People
rem winget uninstall Microsoft.Windows.PeopleExperienceHost
rem winget uninstall Microsoft.Windows.CloudExperienceHost
rem winget uninstall Microsoft.549981C3F5F10
winget uninstall photos
winget uninstall phone
rem winget uninstall Microsoft.XboxGameOverlay
rem winget uninstall Microsoft.XboxGamingOverlay
rem winget uninstall Microsoft.XboxIdentityProvider
rem winget uninstall Microsoft.XboxSpeechToTextOverlay
rem winget uninstall Microsoft.XboxGameCallableUI
winget uninstall edge
rem winget uninstall Microsoft.MicrosoftEdgeBeta
rem winget uninstall Microsoft.MicrosoftEdgeStable
rem winget uninstall Microsoft.MicrosoftEdgeDevToolsClient
rem winget uninstall Microsoft.GamingServices
rem winget uninstall Microsoft.Windows.ShellExperienceHost
rem winget uninstall Microsoft.Windows.StartMenuExperienceHost
winget uninstall "windows web experience pack"
winget uninstall "microsoft teams"
winget uninstall "feedback hub"
winget uninstall paint

powershell -command "Get-AppxPackage *Microsoft.WindowsNotepad* | Remove-AppxPackage"

rem Uninstalls "Remote Desktop Connection" program
mstsc /uninstall

rem Disable "Application Information" service
net stop Appinfo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
