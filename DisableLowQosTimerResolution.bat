rem # Disable Kernel LowQosTimerResolution

rem # !!! WARNING !!!

rem # LOWERS FPS

rem # MAY CAUSE BLUE/GREEN SCREEN OF DEATH ON BOOT
rem # ERROR: KERNAL SECURITY CHECK FAILURE

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableLowQosTimerResolution" /t REG_DWORD /d "1" /f

PAUSE