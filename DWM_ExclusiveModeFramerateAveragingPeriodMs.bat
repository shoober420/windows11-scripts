rem # DWM: ExclusiveModeFramerateAveragingPeriodMs tweak

rem # Desktop Window Manager

rem # !!! WARNING !!!

rem # May cause game freezing if value too low

rem # low values (100 / 0x64) decrease fps for lower input latency, high values (1000 / 0x3e8) increase fps for higher input latency

rem # Can be set lower when using SetTimerResolution -5000 (0.5ms)

rem # !!! WARNING !!!

PAUSE

rem # Executes SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

cd %USERPROFILE%\Downloads\windows11-scripts-main
call SetTimerResolution.bat

rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking

rem # Default (Hex / Decimal): 0x3e8 = 1000
rem # 0x2ee = 750 (FAST SYSTEM ONLY)
rem # 0x1f4 = 500 (VERY FAST SYSTEM ONLY)
rem # 0xfa = 250 (VERY VERY FAST SYSTEM ONLY)
rem # 0x64 = 100 (ULTRA FAST SYSTEM ONLY)

@echo off

echo.
echo Exclusive Mode Framerate Averaging Period Ms
echo.
echo 1. ExclusiveModeFramerateAveragingPeriodMs: 0x64 = 100 (ULTRA FAST SYSTEM ONLY) (LOWER LATENCY)
echo 2. ExclusiveModeFramerateAveragingPeriodMs: 0xfa = 250
echo 3. ExclusiveModeFramerateAveragingPeriodMs: 0x1f4 = 500
echo 4. ExclusiveModeFramerateAveragingPeriodMs: 0x2ee = 750
echo 5. ExclusiveModeFramerateAveragingPeriodMs: 0x3e8 = 1000 (VERY SMOOTH) (DEFAULT)
echo C. Cancel
echo.
choice /c 12345C /m "Choose an option :"

if 6 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 5 EQU %ERRORLEVEL% (
   call :period5
) else if 4 EQU %ERRORLEVEL% (
   call :period4
) else if 3 EQU %ERRORLEVEL% (
   call :period3
) else if 2 EQU %ERRORLEVEL% (
   call :period2
) else if 1 EQU %ERRORLEVEL% (
   call :period1
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:period1
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x64 = 100 (ULTRA FAST SYSTEM ONLY) (LOWER LATENCY)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x64" /f

goto :end

:period2
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0xfa = 250

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0xfa" /f

goto :end

:period3
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x1f4 = 500

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x1f4" /f

goto :end

:period4
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x2ee = 750

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x2ee" /f

goto :end

:period5
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x3e8 = 1000 (VERY SMOOTH) (DEFAULT)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x3e8" /f

goto :end

:end

PAUSE
