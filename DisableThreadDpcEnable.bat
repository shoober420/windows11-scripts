rem # Disable ThreadDpcEnable

rem # Deferred Procedure Call (DPC)
rem # Allows high-priority tasks to defer required but lower-priority tasks for later execution

rem # Thread DPC
rem # Prioritizes critial tasks to execute first

rem # https://www.youtube.com/watch?v=-z7iBgm1hec

rem # https://forums.blurbusters.com/viewtopic.php?t=13323

rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html

rem # Disable ThreadDpcEnable for lower latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ThreadDpcEnable" /t REG_DWORD /d "0" /f

PAUSE