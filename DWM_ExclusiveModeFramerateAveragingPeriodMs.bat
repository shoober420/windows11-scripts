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
rem # 0x2ee = 750 (FAST SYSTEMS ONLY)
rem # 0x1f4 = 500 (VERY FAST SYSTEMS ONLY)
rem # 0xfa = 250 (VERY VERY FAST SYSTEMS ONLY)
rem # 0x64 = 100 (ULTRA FAST SYSTEMS ONLY)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x3e8" /f

PAUSE
