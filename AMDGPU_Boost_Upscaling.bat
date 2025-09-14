rem # AMD Radeon Boost and Upscaling

rem # CAUSES STUTTERING WHEN KEYS ARE PRESENT, 0 OR 1

rem # DRIVER REINSTALL REQUIRED TO FIX
rem # FACTORY SETTINGS: CHECKMARKED > KEEP USER SETTINGS: UNTICKED TO FIX

PAUSE



@echo off



echo.
echo AMD Radeon Boost and Upscaling
echo.
echo 1. Boost and Upscaling DISABLED
echo 2. Boost and Upscaling ENABLED
echo 3. DELETE REG KEYS
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :budel
) else if 2 EQU %ERRORLEVEL% (
   call :buon
) else if 1 EQU %ERRORLEVEL% (
   call :buoff
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:buoff
echo User chose Boost and Upscaling DISABLED

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f

goto :end

:buon
echo User chose Boost and Upscaling ENABLED

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "1" /f

goto :end

:budel
echo User chose DELETE REG KEYS

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonBoostEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingEnabled" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingEnabled" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingSupport" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingSupport" /f

goto :end

:end

PAUSE