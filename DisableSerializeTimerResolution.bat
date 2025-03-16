rem # Disable Serialize Timer Expiration kernel tweak

rem # Enable Serialization
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "1" /f

rem # Disable Serialization
rem # DISTRIBUTES TIMERS AMONG PROCESSORS
rem # LOWERS FPS
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "2" /f

PAUSE