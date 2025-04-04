rem # Kernel Tweaks

rem # Deferred Procedure Call (DPC)
rem # Allows high-priority tasks to defer required but lower-priority tasks for later execution

rem # https://www.youtube.com/watch?v=4OrEytGFdK4

rem # https://www.youtube.com/watch?v=k2Vljto4WYk

rem # https://www.youtube.com/watch?v=YaIVoqRo5-g

rem # https://www.youtube.com/watch?v=omg_EnxUJv4

rem # https://forums.blurbusters.com/viewtopic.php?t=13323

rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdealDpcRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumDpcQueueDepth" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MinimumDpcRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UnlimitDpcQueue" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SplitLargeCaches" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UseNewEaBuffering" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UseNormalStack" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "XMMIZeroingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableAutoBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "AdjustDpcThreshold" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumSharedReadyQueueSize" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "PriorityControl" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableOverlappedExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "QuantumLength" /t REG_DWORD /d "14" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "TimeIncrement" /t REG_DWORD /d "0x0000000f" /f

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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "AdjustDpcThreshold" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "DeepIoCoalescingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IdealDpcRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ForegroundBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "SchedulerAssistThreadFlagOverride" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadBoostType" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "ThreadSchedulingModel" /t REG_DWORD /d "1" /f

rem # IRQ Priority
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ1Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ6Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ7Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ25Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ36Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ39Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ55Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ57Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ1024Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967253Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967254Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967256Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967257Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967258Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967259Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967260Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967261Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967262Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967287Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967288Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967289Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967290Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967291Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967292Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967293Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ4294967294Priority" /t REG_DWORD /d "1" /f

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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "VerifierDpcScalingFactor" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "EnablePerCpuClockTickScheduling" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "HeteroSchedulerOptions" /t REG_DWORD /d "0" /f



rem # Cache Aware Scheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CacheAwareScheduling" /t REG_DWORD /d "7" /f

rem # Debug Poll Interval
rem # https://github.com/ancel1x/Ancels-Performance-Batch
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DebugPollInterval" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DebugPollInterval" /t REG_DWORD /d "0x3e8" /f

rem # Dynamic Tick Disable
rem # https://www.tenforums.com/performance-maintenance/146774-cacheawarescheduling-what-how-does-windows-benefit.html
rem # https://forums.blurbusters.com/viewtopic.php?t=13323
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaxDynamicTickDuration" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MinDynamicTickDuration" /t REG_DWORD /d "0x3e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaxDynamicTickDurationSize" /t REG_DWORD /d "0xffffffff" /f

rem # Setting Service Priorities & Boost
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "PassiveIntRealTimeWorkerPriority" /t REG_DWORD /d "18" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\KernelVelocity" /v "DisableFGBoostDecay" /t REG_DWORD /d "1" /f

rem # Kernel Deadlock Detection
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "EnableDeadGwdTimers" /t REG_DWORD /d "1" /f

PAUSE
