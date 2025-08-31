rem # GPU Scheduling script

rem # Check GPU Scheduling (HAGS) support using DXDiag > "Save All Information" and looking in DxDiag.txt file

rem # Hardware Scheduling: DriverSupportState:AlwaysOff Enabled:False when HAGS DISABLED
rem # Block List: DISABLE_HWSCH when HAGS DISABLED



@echo off



echo.
echo Hardware Accelerated GPU Scheduling (HAGS)
echo.
echo 1. HAGS + GPU PREEMPTION ENABLED (REQUIRED FOR DLSS)
echo 2. HAGS + GPU PREEMPTION DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :hagsoff
) else if 1 EQU %ERRORLEVEL% (
   call :hagson
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:hagson
echo User chose HAGS + GPU PREEMPTION ENABLED (REQUIRED FOR DLSS)

rem # Enable Hardware Accelerated GPU Scheduling (HAGS)
rem # GPU to handle some of its own scheduling tasks, potentially reducing CPU overhead and latency
rem # Required for DLSS Frame Generation
rem # 2 = HAGS ON / 1 = HAGS OFF

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchTreatExperimentalAsStable" /t REG_DWORD /d "1" /f

call EnableGPUPreemption.bat

goto :end

:hagsoff
echo User chose HAGS + GPU PREEMPTION DISABLED

rem # Disable Hardware Accelerated GPU Scheduling (HAGS)
rem # GPU to handle some of its own scheduling tasks, potentially reducing CPU overhead and latency
rem # Required for DLSS Frame Generation
rem # 2 = HAGS ON / 1 = HAGS OFF

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchTreatExperimentalAsStable" /t REG_DWORD /d "0" /f

call DisableGPUPreemption.bat

goto :end

:end