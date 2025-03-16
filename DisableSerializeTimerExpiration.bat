rem # Disable Serialize Timer Expiration kernel tweak

rem # Enable Serialization Standby
rem # Allows the kernel to make the decision based on non-Modern Standby systems

reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /f

rem reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "0" /f

PAUSE
