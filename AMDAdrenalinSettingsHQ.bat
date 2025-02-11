rem # AMD Adrenalin video card tweaks
rem # PERFORMANCE

rem # Last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AdvancedMetrics_NA" /t REG_SZ /d "false" /f

rem # HQ AF
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AreaAniso_NA" /t REG_SZ /d "1" /f

rem # Adaptive Sampled Transparent Textures AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ASTT_NA" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AAF_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoTuneRequest_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DDC2Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DVRTrackingEnabledBuild" /t REG_SZ /d "0" /f

rem # Enchanced Quality Mode for AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EQAA_NA" /t REG_SZ /d "0" /f

rem # Geometry Instancing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "GI_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f

rem # Morphological AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MLF_NA" /t REG_SZ /d "0" /f

rem # HQ Textures
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TFQ_NA" /t REG_DWORD /d "1" /f



reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AAAMethod_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AAF_DEF" /t REG_SZ /d "0" /f

rem # AF: 1=2x, 2=4x, 3=8x, 4=16x / 0=App controlled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AnisoDegree_DEF" /t REG_SZ /d "4" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AnisoType_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiAlias_DEF" /t REG_SZ /d "0" /f

rem # AF: 0 = App. controled, 2,4,8,16 Forced Mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AreaAniso_DEF" /t REG_SZ /d "16" /f

rem # Adaptive Sampled Transparent Textures
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ASTT_DEF" /t REG_SZ /d "1" /f

rem # Adaptive AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ATMS_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ATMS_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CatalystAI_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableTripleBuffering_DEF" /t REG_SZ /d "0" /f

rem # Enchanced Quality Mode for AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EQAA_DEF" /t REG_SZ /d "0" /f

rem # Geometry Instancing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "GI_DEF" /t REG_SZ /d "0" /f

rem # Experimental buffering tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "GLPBMode_DEF" /t REG_SZ /d "0" /f

rem # Morphological AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "MLF_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Tessellation_OPTION_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TextureLod_DEF" /t REG_SZ /d "0" /f

rem # HQ Textures
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TFQ_DEF" /t REG_SZ /d "1" /f

PAUSE