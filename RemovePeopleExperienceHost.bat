rem # Uninstall Windows People Experience Host

powershell -command "Get-AppxPackage *Microsoft.Windows.PeopleExperienceHost* | Remove-AppxPackage"

PAUSE