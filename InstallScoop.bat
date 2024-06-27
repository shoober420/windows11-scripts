# Install Scoop (as admin)

rem # Enable PowerShell
powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

powershell iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
powershell scoop update

PAUSE
