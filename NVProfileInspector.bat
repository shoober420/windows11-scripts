rem # NVIDIA Profile Inspector selector

@echo off

@echo off

echo.
echo NVIDIA Profile Inspector selector
echo.
echo 1. Performance
echo 2. High Quality OGL
echo 3. High Quality D3D
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :d3d
) else if 2 EQU %ERRORLEVEL% (
   call :ogl
) else if 1 EQU %ERRORLEVEL% (
   call :perf
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:perf
echo User chose Performance

start "%USERPROFILE%\Downloads\NvidiaProfileInspector\nvidiaProfileInspector.exe" "%~dp0\NVIDIAPerformanceProfile.nip"

goto :end

:ogl
echo User chose High Quality OGL

start "%USERPROFILE%\Downloads\NvidiaProfileInspector\nvidiaProfileInspector.exe" "%~dp0\NVIDIAPerformanceProfile.nip"

goto :end

:d3d
echo User chose High Quality D3D

start "%USERPROFILE%\Downloads\NvidiaProfileInspector\nvidiaProfileInspector.exe" "%~dp0\NVIDIAPerformanceProfile.nip"

goto :end

:end

PAUSE