rem # Disable SysMain service (SuperFetch)

rem 0 - Disable SuperFetch / 1 - Enable SuperFetch when the application starts up / 2 - Enable SuperFetch when the device starts up / 3 - Enable SuperFetch when the application or device starts up
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f

net stop SysMain
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f

PAUSE