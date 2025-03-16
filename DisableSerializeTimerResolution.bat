rem # Disable Serialize Timer Expiration kernel tweak

rem # !!! WARNING !!!

rem # LOWERS FPS

rem # TESTING ONLY

rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "2" /f

PAUSE