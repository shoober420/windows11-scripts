rem # DWM: ExclusiveModeFramerateAveragingPeriodMs tweak

rem # Desktop Window Manager

rem # !!! WARNING !!!

rem # May cause game freezing if value too low

rem # Can be set lower when using SetTimerResolution -5000 (0.5ms)

rem # !!! WARNING !!!

PAUSE

rem # Executes SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

cd %USERPROFILE%\Downloads\windows11-scripts-main
call SetTimerResolution.bat

rem # Default 1000
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "100" /f

PAUSE
