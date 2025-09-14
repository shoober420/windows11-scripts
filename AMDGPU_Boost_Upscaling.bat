rem # AMD Radeon Boost and Upscaling

rem # CAUSES STUTTERING WHEN KEYS ARE PRESENT, 0 OR 1

rem # DRIVER REINSTALL > FACTORY SETTINGS: CHECKMARKED > KEEP USER SETTINGS: UNTICKED TO FIX

PAUSE



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

PAUSE