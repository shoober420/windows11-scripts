rem # AMD Adrenalin VSYNC Disabled

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

rem # 0 = Always Off / 1 = Default Off / 2 = Default On / 3 = Always On
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_NA" /t REG_SZ /d "0" /f

)
)
)

PAUSE