rem # Script for taking ownership of Windows Defender reg keys and other bloat

rem # Requires SetACL.exe (https://helgeklein.com/download/)

rem # Make sure SetACL zip archive is extracted correctly in your Downloads directory

PAUSE

cd "%USERPROFILE%\Downloads\SetACL (executable version)\64 bit"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\TrustedInstaller" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\TrustedInstaller" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdiSystemHost" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdiSystemHost" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdiServiceHost" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdiServiceHost" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\TrkWks" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\TrkWks" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DPS" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DPS" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SecurityHealthService" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SecurityHealthService" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wscsvc" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wscsvc" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SamSs" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SamSs" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdBoot" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdBoot" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdFilter" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdFilter" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisDrv" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisDrv" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisSvc" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisSvc" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WinDefend" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WinDefend" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MDCoreSvc" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MDCoreSvc" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MpKsl863bd5cf" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MpKsl863bd5cf" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DcomLaunch" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DcomLaunch" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\EventLog-Security" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\EventLog-Security" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Security" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Security" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\Cellcore" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\Cellcore" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\NetCore" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\NetCore" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\RadioMgr" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\RadioMgr" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDa" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDa" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter\ActivationType" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter\ActivationType" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform\Registered" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform\Registered" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\DisableDiagnosticTracing" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\DisableDiagnosticTracing" -ot reg -actn ace -ace "n:Administrators;p:full"


SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy\AllowHeadlessExecution" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy\AllowHeadlessExecution" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy\AllowMultipleBackgroundTasks" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy\AllowMultipleBackgroundTasks" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\WOW6432Node\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\WOW6432Node\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\WOW6432Node\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\WOW6432Node\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder\Attributes" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder\Attributes" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds\ShellFeedsTaskbarViewMode" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds\ShellFeedsTaskbarViewMode" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\ConfigureChatAutoInstall" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\ConfigureChatAutoInstall" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings\DisableSendGenericDriverNotFoundToWER" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings\DisableSendGenericDriverNotFoundToWER" -ot reg -actn ace -ace "n:Administrators;p:full"

PAUSE
