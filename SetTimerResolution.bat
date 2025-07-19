rem # Launches SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

rem # Requires VCRedist.bat packages

rem # --resolution 5000 = 0.5ms
rem # --resolution 10000 = 1.0ms

PAUSE

cd "%USERPROFILE%\Downloads"
start SetTimerResolution.exe --resolution 10000 --no-console

PAUSE
