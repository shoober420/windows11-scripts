rem # Disable Kernel DPC Tweaks

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeout" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "IdealDpcRate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumDpcQueueDepth" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MinimumDpcRate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "UnlimitDpcQueue" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "AdjustDpcThreshold" /f

rem # Priority Control Tweaks
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "AdjustDpcThreshold" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IdealDpcRate" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "VerifierDpcScalingFactor" /f


reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcCumulativeSoftTimeout" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcQueueDepth" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileBufferSizeBytes" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DynamicDpcProtocol" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumDpcRate" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcRequestRate" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcRoutineActive" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcSoftTimeout" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeLimit" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileCumulativeDpcThreshold" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileSingleDpcThreshold" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcDuration" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcLastCount" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeCount" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ForceDpcDmaCoalesce" /f

PAUSE