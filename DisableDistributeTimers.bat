rem # Disable DistributeTimers kernel tweak

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /f

PAUSE