rem Script for taking ownership of Windows Defender services and other bloat

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

PAUSE
