rem # AMD Adrenalin VSYNC Enabled

rem # 0 = Always Off / 1 = Default Off / 2 = Default On / 3 = Always On
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl" /t REG_BINARY /d "3300" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_NA" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_NA" /t REG_SZ /d "3" /f

PAUSE