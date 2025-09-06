rem # Kernel Tweaks

rem # Deferred Procedure Call (DPC)
rem # Allows high-priority tasks to defer required but lower-priority tasks for later execution

rem # https://www.youtube.com/watch?v=4OrEytGFdK4

rem # https://www.youtube.com/watch?v=k2Vljto4WYk

rem # https://www.youtube.com/watch?v=YaIVoqRo5-g

rem # https://www.youtube.com/watch?v=omg_EnxUJv4

rem # https://forums.blurbusters.com/viewtopic.php?t=13323

rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html


rem # LargeSystemCache
rem # FOR FILE SERVERS, 0 FOR GAMING
rem # 0 = Standard size file-system cache of approximately 8 MB
rem # 1 = Large system cache working set that can expand to physical memory, minus 4 MB, if needed
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "LargeSystemCache" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SplitLargeCaches" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UseNewEaBuffering" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UseNormalStack" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "XMMIZeroingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableAutoBoost" /t REG_DWORD /d "1" /f

rem # Maximum Shared Ready Queue Size
rem # Limits the amount of memory that can be used to store pages that are ready to be used by the system
rem # Default value is 0, meaning the system uses its own heuristics to determine the optimal size for the ready queue
rem # 0 and 1 lower FPS
rem # 256 causes kernel error at boot
rem # AlchemyTweaks = 128
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\MaximumSharedReadyQueueSize" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumSharedReadyQueueSize" /t REG_DWORD /d "128" /f

rem # AlchemyTweaks = 50 / blurbusters = 54
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "PriorityControl" /t REG_DWORD /d "32" /f

rem # AlchemyTweaks / blurbusters = 20
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "QuantumLength" /t REG_DWORD /d "14" /f

rem # AlchemyTweaks / blurbusters = 15
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "TimeIncrement" /t REG_DWORD /d "0x0000000f" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableOverlappedExecution" /t REG_DWORD /d "0" /f

rem # Disable Intel Transactional Synchronization Extensions
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t Reg_DWORD /d "1" /f

rem # Disable Coalescing Timer Interval
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f

rem # Disable Interrupt Steering
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f

rem # Priority Control Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "DeepIoCoalescingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ForegroundBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "SchedulerAssistThreadFlagOverride" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadBoostType" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadSchedulingModel" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "CriticalPriorityBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "EnableBackgroundThreadScheduling" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "EnableInputThreadBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadAffinityBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadCycleTimeOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "TimeCriticalThreads" /t REG_DWORD /d "1" /f

rem # AlchemyTweaks / alufena / blurbusters = 32 / 65536
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "BufferSize" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IoEnqueueIrp" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IoQueueWorkItem" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IoQueueWorkItemToNode" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IoQueueWorkItemEx" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IoQueueThreadIrp" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ExTryQueueWorkItem" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ExQueueWorkItem" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "StackSubSystemStackSize" /t REG_DWORD /d "65536" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "RebalanceMinPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdealModeRandomized" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "TtmEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnablePerCpuClockTickScheduling" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "HeteroSchedulerOptions" /t REG_DWORD /d "0" /f



rem # Cache Aware Scheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CacheAwareScheduling" /t REG_DWORD /d "7" /f

rem # Debug Poll Interval
rem # https://github.com/ancel1x/Ancels-Performance-Batch
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DebugPollInterval" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DebugPollInterval" /t REG_DWORD /d "0x3e8" /f

rem # Setting Service Priorities & Boost
rem # Ancels / fidelity / Chinese = 18
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "PassiveIntRealTimeWorkerPriority" /t REG_DWORD /d "18" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\KernelVelocity" /v "DisableFGBoostDecay" /t REG_DWORD /d "1" /f

rem # Kernel Deadlock Detection
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "EnableDeadGwdTimers" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "PowerOffFrozenProcessors" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnableWerUserReporting" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ForceParkingRequested" /t REG_DWORD /d "0" /f

rem # Windows Thread Priorities: Threads are scheduled for execution based on their priority, ranging from 0 (lowest) to 31 (highest)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "BugCheckUnexpectedInterrupts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ClockTimerAlwaysOnPresent" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ClockTimerHighLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ClockTimerPerCpu" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DelayCloseSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DelayDerefKCBLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableBufferedIoInit" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnableTickAccumulationFromAccountingPeriods" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnableTsx" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ForceForegroundBoostDecay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ForceIdleGracePeriod" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdealNodeRandomized" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdleDurationExpirationTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdleScanInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KiClockTimerAlwaysOnPresent" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KiClockTimerHighLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KiClockTimerPerCpu" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "PassiveWatchdogTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "WatchdogResumeTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "WorkerFactoryThreadIdleTimeout" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableLightWeightSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdleHalt" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "InterruptLastCount" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "InterruptRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "InterruptRequest" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "LowPriorityBackgroundWorkItemQueue" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "PendingTickFlags" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "RealTimeIsCritical" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SeLpacEnablwatsonReporting" /t REG_DWORD /d "0" /f

rem # LEGACY POWER OPTION, DELETE REG KEY
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "AdditionalClockTicksInProcessor" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "AdditionalClockTicksInProcessor" /t REG_DWORD /d "99999999" /f

PAUSE



rem # IRQ Priority
rem # Never have the same value for each priority
rem # NOT NEEDED FOR MODERN WINDOWS
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ00Priority" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ1Priority" /t REG_DWORD /d "2" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ6Priority" /t REG_DWORD /d "3" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ7Priority" /t REG_DWORD /d "4" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "5" /f

rem # alufena = 2
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "6" /f

rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ23Priority" /t REG_DWORD /d "7" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ25Priority" /t REG_DWORD /d "8" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ36Priority" /t REG_DWORD /d "9" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ39Priority" /t REG_DWORD /d "10" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ55Priority" /t REG_DWORD /d "11" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ57Priority" /t REG_DWORD /d "12" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ1024Priority" /t REG_DWORD /d "13" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967253Priority" /t REG_DWORD /d "14" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967254Priority" /t REG_DWORD /d "15" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967256Priority" /t REG_DWORD /d "16" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967257Priority" /t REG_DWORD /d "17" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967258Priority" /t REG_DWORD /d "18" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967259Priority" /t REG_DWORD /d "19" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967260Priority" /t REG_DWORD /d "20" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967261Priority" /t REG_DWORD /d "21" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967262Priority" /t REG_DWORD /d "22" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967267Priority" /t REG_DWORD /d "23" /f

rem # alufena = 2
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967286Priority" /t REG_DWORD /d "24" /f

rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967287Priority" /t REG_DWORD /d "25" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967288Priority" /t REG_DWORD /d "26" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967289Priority" /t REG_DWORD /d "27" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967290Priority" /t REG_DWORD /d "28" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967291Priority" /t REG_DWORD /d "29" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967292Priority" /t REG_DWORD /d "30" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967293Priority" /t REG_DWORD /d "31" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967294Priority" /t REG_DWORD /d "32" /f
