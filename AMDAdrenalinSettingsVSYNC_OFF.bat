rem # AMD Adrenalin VSYNC Disabled

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt



rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)



for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (



rem # 3000 / 0 = Always Off (BREAKS Hardware Composed: Independent Flip)
rem # 3100 / 1 = Off, unless application specifies
rem # 3200 / 2 = On, unless application specifies
rem # 3300 / 3 = Always on (Dynamic VSync)
rem # 3400 / 4 = Always on (Lock to monitor refresh rate)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_NA" /t REG_SZ /d "0" /f

)
)
)

PAUSE