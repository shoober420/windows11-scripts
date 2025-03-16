rem # Enable Distribute Timers kernel tweak

rem # !!! WARNING !!!

rem # Increases latency

rem # !!! WARNING !!!

rem # https://www.youtube.com/watch?v=aH_niUv2OnM

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f

PAUSE