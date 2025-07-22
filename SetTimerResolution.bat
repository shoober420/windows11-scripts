rem # Launches SetTimerResolution.exe
rem # https://github.com/valleyofdoom/TimerResolution

rem # Requires VCRedist.bat packages

rem # --resolution 5000 = 0.5ms
rem # --resolution 10000 = 1.0ms

PAUSE

@echo off


echo.
echo Timer Resolution
echo.
echo 1. Timer Resolution: 0.5ms
echo 2. Timer Resolution: 1.0ms
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :res1
) else if 1 EQU %ERRORLEVEL% (
   call :res
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:res
echo User chose Timer Resolution: 0.5ms

cd "%USERPROFILE%\Downloads"
start SetTimerResolution.exe --resolution 5000 --no-console

goto :end

:res1
echo User chose Timer Resolution: 1.0ms

cd "%USERPROFILE%\Downloads"
start SetTimerResolution.exe --resolution 10000 --no-console

goto :end

:end

PAUSE
