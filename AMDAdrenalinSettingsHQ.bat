rem # AMD Adrenalin video card tweaks
rem # HIGH QUALITY

rem # Last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used

rem # https://forums.guru3d.com/threads/radeonmod-tweak-utility.403389/page-12

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AdvancedMetrics_NA" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AdvancedMetrics_DEF" /t REG_SZ /d "false" /f

rem # High Quality Anisotropic Filtering
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AreaAniso_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AreaAniso_DEF" /t REG_SZ /d "1" /f

rem # Adaptive Sampled Transparent Textures AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ASTT_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ASTT_DEF" /t REG_SZ /d "1" /f

rem # AA extra options
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AAF_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AAF_DEF" /t REG_SZ /d "0" /f

rem # Adaptive AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ATMS_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ATMS_DEF" /t REG_SZ /d "0" /f

rem # Super Sampling on Adaptive Anti Aliasing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ASE_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ASE_DEF" /t REG_SZ /d "1" /f

rem # Super Sampling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ASD_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ASD_DEF" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AutoColorDepthReduction_DEF" /t REG_DWORD /d "0" /f

rem # Enchanced Quality Mode for AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EQAA_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EQAA_DEF" /t REG_SZ /d "1" /f

rem # Geometry Instancing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "GI_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "GI_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f

rem # Morphological AA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MLF_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "MLF_DEF" /t REG_SZ /d "0" /f

rem # Texture Filtering Quality
rem # 0 = High / 2 = Performance
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TFQ_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TFQ_DEF" /t REG_SZ /d "0" /f

rem # Multi-GPU rendering mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MVPU_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "MVPU_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AAAMethod_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AAAMethod_DEF" /t REG_SZ /d "0" /f

rem # Anisotropic Filtering: 0 = Off / 2x / 4x / 8x / 16x
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AnisoDegree_NA" /t REG_SZ /d "16" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AnisoDegree_DEF" /t REG_SZ /d "16" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AnisoType_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AnisoType_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiAlias_NA" /t REG_SZ /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiAlias_DEF" /t REG_SZ /d "2" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiAliasSamples_NA" /t REG_SZ /d "8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiAliasSamples_DEF" /t REG_SZ /d "8" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CatalystAI_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CatalystAI_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableTripleBuffering_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableTripleBuffering_DEF" /t REG_SZ /d "0" /f

rem # Experimental buffering tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "GLPBMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "GLPBMode_DEF" /t REG_SZ /d "0" /f

rem # Surface Format Optimizations (LEGACY: DISABLE)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "SurfaceFormatReplacements_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "0" /f

rem # 0 = AMD Optimized / 1 = Default On / 2 = Always On
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Tessellation_OPTION_NA" /t REG_SZ /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Tessellation_OPTION_DEF" /t REG_SZ /d "2" /f

rem # 1 = Off / 2 / 4 / 6 / 8 / 16 / 32 / 64
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Tessellation_NA" /t REG_SZ /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Tessellation_DEF" /t REG_SZ /d "64" /f

rem # Texture Optimizations
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TextureOpt_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TextureOpt_DEF" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TextureLod_NA" /t REG_SZ /d "-1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TextureLod_DEF" /t REG_SZ /d "-1" /f

rem # 0 = Always Off / 1 = Default Off / 2 = Default On / 3 = Always On
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "0" /f



)
)
)

PAUSE