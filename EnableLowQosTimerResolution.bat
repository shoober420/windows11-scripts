rem # Enable Kernel LowQosTimerResolution

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableLowQosTimerResolution" /t REG_DWORD /d "0" /f

PAUSE