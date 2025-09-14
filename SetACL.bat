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

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter\ActivationType" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter\ActivationType" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform\Registered" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform\Registered" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\DisableDiagnosticTracing" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\DisableDiagnosticTracing" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\BootCKCLSettings\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings\Start" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance\ShutdownCKCLSettings\Start" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\BackgroundModel\BackgroundAudioPolicy" -ot reg -actn ace -ace "n:Administrators;p:full"

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

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\ConfigureChatAutoInstall" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications\ConfigureChatAutoInstall" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings\DisableSendGenericDriverNotFoundToWER" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase\Policies\Settings\DisableSendGenericDriverNotFoundToWER" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Configuration" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Configuration" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f8278c54-a712-415b-b593-b77a2be0dda9}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f8278c54-a712-415b-b593-b77a2be0dda9}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{EDC978D6-4D53-4b2f-A265-5805674BE568}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{EDC978D6-4D53-4b2f-A265-5805674BE568}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{8FD8B88D-30E1-4F25-AC2B-553D3D65F0EA}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{8FD8B88D-30E1-4F25-AC2B-553D3D65F0EA}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{5b934b42-522b-4c34-bbfe-37a3ef7b9c90}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{5b934b42-522b-4c34-bbfe-37a3ef7b9c90}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{2F6CE85C-F9EE-43CA-90C7-8A9BD53A2467}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{2F6CE85C-F9EE-43CA-90C7-8A9BD53A2467}" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{088e3905-0323-4b02-9826-5d99428e115f}\DefaultIcon" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_CLASSES_ROOT\CLSID\{088e3905-0323-4b02-9826-5d99428e115f}\DefaultIcon" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Themes\Wallpaper" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Themes\Wallpaper" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "C:\WINDOWS\Fonts" -ot file -actn setowner -ownr "n:Administrators"
SetACL.exe -on "C:\WINDOWS\Fonts" -ot file -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "C:\Windows.old" -ot file -actn setowner -ownr "n:Administrators"
SetACL.exe -on "C:\Windows.old" -ot file -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Defender\Features" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Defender\Features" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Defender" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Defender" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ot reg -actn ace -ace "n:Administrators;p:full"

# garlin
# https://www.elevenforum.com/t/recursively-take-ownership-of-reg-key-trees-in-powershell.39417/post-637373
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render" -ot reg -rec yes -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render" -ot reg -rec yes -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Assistance\Client\1.0\Settings" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Assistance\Client\1.0\Settings" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Assistance\Client\1.0\Settings\GlobalOnlineAssist" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Assistance\Client\1.0\Settings\GlobalOnlineAssist" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameBar" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameBar" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameBar\ActivationType" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameBar\ActivationType" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlay" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlay" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlay\ActivationType" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlay\ActivationType" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlayMessageSource" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlayMessageSource" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlayMessageSource\ActivationType" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI.GameChatOverlayMessageSource\ActivationType" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DelayedApps" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DelayedApps" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DelayedApps\Delay_Sec" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DelayedApps\Delay_Sec" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ResourceTimers" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ResourceTimers" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ResourceTimers\EnableResourceAwareTimers" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ResourceTimers\EnableResourceAwareTimers" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.delete" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.delete" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.delete\SkipCloudDownload" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.delete\SkipCloudDownload" -ot reg -actn ace -ace "n:Administrators;p:full"

PAUSE