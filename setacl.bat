rem Script for taking ownership of Windows Defender services

SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SecurityHealthService" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wscsvc" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdBoot" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdFilter" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisDrv" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisSvc" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl
SetACL -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WinDefend" -ot file -actn trustee -trst n1:MyDomain\SomeUserOrGroup;ta:remtrst;w:dacl

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SecurityHealthService" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SecurityHealthService" -ot reg -actn ace -ace "n:Administrators;p:full"

SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wscsvc" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -on "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wscsvc" -ot reg -actn ace -ace "n:Administrators;p:full"

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

PAUSE
