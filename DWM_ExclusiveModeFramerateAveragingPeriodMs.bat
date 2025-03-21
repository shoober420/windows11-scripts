rem # Too low of a value can cause game freezing (default 1000)
rem # Can be set lower when using SetTimerResolution -5000 (0.5ms)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "100" /f

PAUSE
