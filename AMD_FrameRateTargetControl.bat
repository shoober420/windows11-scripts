rem # AMD Frame Rate Target Control (FRTC)

rem # !!! REBOOT REQUIRED !!!

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt



@echo off



echo.
echo AMD Frame Rate Target Control (FRTC)
echo.
echo 1. FRTC ON
echo 2. FRTC OFF
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :frtcoff
) else if 1 EQU %ERRORLEVEL% (
   call :frtcon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:frtcon
echo User chose FRTC ON

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_FRTEnabled" /t REG_DWORD /d "1" /f

)
)
)

goto :end

:frtcoff
echo User chose FRTC OFF

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f

)
)
)

goto :end

:end



echo.
echo FRAME RATE LIMIT
echo.
echo 1. 60 FPS
echo 2. 100 FPS
echo 3. 120 FPS
echo 4. 999 FPS (USE WITH FRTC OFF)
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :999
) else if 3 EQU %ERRORLEVEL% (
   call :120
) else if 2 EQU %ERRORLEVEL% (
   call :100
) else if 1 EQU %ERRORLEVEL% (
   call :60
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:60
echo User chose 60 FPS

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (


rem # FPS in Hexidecimal
rem # 999FPS = 0x3E7
rem # 120FPS = 0x78
rem # 100FPS = 0x64
rem # 60FPS = 0x3C
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3C" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3C" /f

)
)
)

goto :end

:100
echo User chose 100 FPS

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (


rem # FPS in Hexidecimal
rem # 999FPS = 0x3E7
rem # 120FPS = 0x78
rem # 100FPS = 0x64
rem # 60FPS = 0x3C
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x64" /f

)
)
)

goto :end

:120
echo User chose 120 FPS

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (


rem # FPS in Hexidecimal
rem # 999FPS = 0x3E7
rem # 120FPS = 0x78
rem # 100FPS = 0x64
rem # 60FPS = 0x3C
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x78" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x78" /f

)
)
)

goto :end

:999
echo User chose 999 FPS (USE WITH FRTC OFF)

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (


rem # FPS in Hexidecimal
rem # 999FPS = 0x3E7
rem # 120FPS = 0x78
rem # 100FPS = 0x64
rem # 60FPS = 0x3C
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3E7" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_MaxFrameRateRequested" /t REG_DWORD /d "0x3E7" /f

)
)
)

goto :end

:end

rem # !!! REBOOT REQUIRED !!!

PAUSE
