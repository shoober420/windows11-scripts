rem # Timer Tweaks

rem # https://sites.google.com/view/melodystweaks/misconceptions-about-timers-hpet-tsc-pmt

rem # https://www.xbitlabs.com/hpet-settings/

rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html

rem # https://forums.blurbusters.com/viewtopic.php?t=13323

rem # Leave HPET enabled in BIOS

rem # Timer Resolution Tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f

rem # Disable HPET in Windows
rem # useplatformclock not found by default, setting not present unless enabled prior
bcdedit /deletevalue useplatformclock

rem # Disable RTC (Real Time Clock)
rem # Lowers FPS when enabled
bcdedit /deletevalue useplatformtick

rem # Disable Dynamic Tick (power saving feature)
bcdedit /set disabledynamictick yes

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableDynamicTick" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DISABLE_DYNAMIC_TICK" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaxDynamicTickDuration" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MinDynamicTickDuration" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaxDynamicTickDurationSize" /t REG_DWORD /d "0xffffffff" /f

rem # TSC Sync Policy
bcdedit /set tscsyncpolicy enhanced

rem # Packet Scheduler Timer Resolution
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f

rem # Packet Scheduler - Limit outstanding packets
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "0" /f

rem # Packet Scheduler - Limit reservable bandwidth
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "DisableDynamicTick" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "DisableDynamicTickOnSpecificCores" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "DisableSleepIdle" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "EnableClockSteering" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "EnableHighResolutionTaskScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "EnableHighResolutionTimers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "ForceClockSync" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "ForceHighestPrecision" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "ForceUseHardwareTimer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "MinTimerResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "ReduceIdleTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "TimerFrequencyBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "TimerResolution" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "BackgroundTaskOptimization" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "DisableBackgroundTaskPriorityBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "DisableBackgroundTasksDuringGaming" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "DisableIdleTaskScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "DisableTaskMigration" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "EnableExclusiveTaskScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "EnableHighResolutionTaskScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "EnableRealTimeScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "ForceRealTimePriority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "PreventTaskThrottling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "RealtimeTaskOptimization" /t REG_DWORD /d "1" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "SchedulerQuantumSize" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "TaskSchedulerPriorityBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "UseProcessorGroups" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ResourceTimers" /v "EnableResourceAwareTimers" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\QoS" /v "TimerResolution" /t REG_DWORD /d "1" /f

PAUSE