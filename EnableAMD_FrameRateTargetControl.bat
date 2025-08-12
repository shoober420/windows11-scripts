rem # Enable AMD Frame Rate Target Control (FRTC)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_FRTEnabled" /t REG_DWORD /d "1" /f

rem # FPS in Hexidecimal
rem # 999FPS = 0x3E7
rem # 100FPS = 0x64
rem # 60FPS = 0x3C
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3C" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3C" /f

PAUSE