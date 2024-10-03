rem # Uninstall AAD Broker Plugin
rem # Azure Active Directory (AAD)
rem # Microsoft Entra ID

powershell -command "Get-AppxPackage *Microsoft.Windows.PeopleExperienceHost* | Remove-AppxPackage"

PAUSE