rem # AMD GPU Tweaks
rem # Works on AMD/ATI GPUs ONLY
rem # Also use on AMD/NVIDIA combo laptops

rem # Timeout Detection and Recovery (TDR)
rem # Monitors and resets graphics cards that aren't responding quickly enough

rem # Digital Screen Compression / Display Stream Compression (DSC)
rem # DOES NOT SUPPORT DSC. Black screen will occur if used with DSC monitors

rem # RECOMMENDED TO DISABLE ONBOARD INTEGRATED GPU IN BIOS AND DEVICE MANAGER AND USE DEDICATED GPU ONLY

rem # IMPROVE LATENCY AT THE COST OF LITTLE LESS FPS

PAUSE

rem # Sources:
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem # AMD video card tweaks

rem # Last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

rem # Disable DMA Copy
rem # Direct Memory Access (DMA) engines for data transfers between system memory and the GPU, or within the GPU itself
rem # Uses GPU instead of CPU for DMA (similar to HAGS)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableDMACopy" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f

rem # FlipQueueSize = Pre-Rendered Frames (DX9)
rem # FlipQueueSize 3000=0 will use the default 3 value

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlipQueueSize_SET" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize_SET" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlipQueueSize_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlipQueueSize_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize_NA" /t REG_SZ /d "0" /f

rem # Main3D = Graphics Presets and FlipQueueSize (DX10+)
rem # 3000 = 0 (Custom Graphics+FlipQueueSize 1)
rem # 3100 = 1 (Optimal Performance+FlipQueueSize 1)
rem # 3200 = 2 (High Performance+FlipQueueSize 2)
rem # 3300 = 3 (Balanced+FlipQueueSize 3) (DEFAULT)
rem # 3400 = 4 (High Quality+FlipQueueSize 3)
rem # 3500 = 5 (Optimal Quality+FlipQueueSize 3)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Main3D" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3000" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Main3D_SET" /t REG_BINARY /d "3000" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_SET" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Main3D_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Main3D_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f

rem # Shader Cache / 3000=OFF 3100=OPTIMIZED 3200=ALWAYS ON

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ShaderCache" /t REG_BINARY /d "3200" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ShaderCache_DEF" /t REG_SZ /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ShaderCache_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache_DEF" /t REG_SZ /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiStuttering" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiStuttering" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiStuttering_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiStuttering_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiStuttering_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AntiStuttering_NA" /t REG_SZ /d "0" /f

rem # AMD GPU tweaks

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3D_Refresh_Rate_Override_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3D_Refresh_Rate_Override_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "3D_Refresh_Rate_Override_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "3D_Refresh_Rate_Override_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3to2Pulldown_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3to2Pulldown_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "3to2Pulldown_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "3to2Pulldown_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSkins" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSnapshot" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSubscription" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AllowSkins" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AllowSnapshot" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AllowSubscription" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableUlps" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableUlps_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableUlps_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "StutterMode" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisablePowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableVceSwClockGating" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUvdClockGating" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisablePowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableVceSwClockGating" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableUvdClockGating" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AsicOnLowPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "GCOOPTION_DisableGPIOPowerSaveMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DisableSQRamping" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DisablePowerContainment" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableContextBasedPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAllClockGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlocknv11" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableFBCForFullScreenApp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableFBCSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableEarlySamuInit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalAllowDirectMemoryAccessTrig" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalAllowDPrefSwitchingForGLSync" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TVEnableOverscan" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AsicOnLowPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "GCOOPTION_DisableGPIOPowerSaveMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DisableSQRamping" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DisablePowerContainment" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableContextBasedPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableAllClockGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableBlocknv11" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableFBCForFullScreenApp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableFBCSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableEarlySamuInit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DalAllowDirectMemoryAccessTrig" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DalAllowDPrefSwitchingForGLSync" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TVEnableOverscan" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NoOSPowerOptions" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "NoOSPowerOptions" /t REG_DWORD /d "1" /f

rem # Enable GPU Scheduler
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f

rem # Enable CPU Affinity Optimization for GPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f

rem # DirectPlay Acceleration (Deprecated)
rem # Invisible mouse cursor in CS2 when set to 0
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableHWCursor" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableHWCursor" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f

rem # Disable Radeon Upscaling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RADEON_UPSCALING_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "RADEON_UPSCALING_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DynamicContrast" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DynamicContrast_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DynamicContrast_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DynamicContrast" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DynamicContrast_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DynamicContrast_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "hotkeys_ui_component_na" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "hotkeys_ui_component_def" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "imagesharpening_runtime_component_na" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "imagesharpening_runtime_component_def" /t REG_SZ /d "false" /f

rem # Radeon Chill Power Saving
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_ChillEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_ChillEnabled" /t REG_DWORD /d "0" /f

rem # Radeon Anti-Lag
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f

rem # Image Sharpening
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_USUEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_USUEnable" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "OverclockEnabled_DEF" /t REG_SZ /d "True" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "OverclockEnabled_NA" /t REG_SZ /d "False" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "OverclockEnabled_DEF" /t REG_SZ /d "True" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "OverclockEnabled_NA" /t REG_SZ /d "False" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "powermanagement_delag_component_na" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "powermanagement_delag_component_def" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CameraShakeMotionDetect" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CameraShakeMotionDetect_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CameraShakeMotionDetect_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CameraShakeMotionDetect" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CameraShakeMotionDetect_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "CameraShakeMotionDetect_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "chill_component_na" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "chill_component_def" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoTuneRequest" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoTuneRequest_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoTuneRequest_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AutoTuneRequest" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AutoTuneRequest_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AutoTuneRequest_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DDC2Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DVRTrackingEnabledBuild" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DDC2Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DVRTrackingEnabledBuild" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DisableVariableRefreshRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_TdrDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_DisableVariableRefreshRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_TdrDelay" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "freesync_runtime_component_na" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "freesync_runtime_component_def" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "mobile_runtime_component_NA" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "mobile_runtime_component_DEF" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MobileLinkOverCloudAuth_DEF" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "MobileLinkOverCloudAuth_DEF" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ogltriplebuffering_ui_component_na" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ogltriplebuffering_ui_component_def" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerSaverAutoEnable_DEF" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerSaverAutoEnable_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PowerSaverAutoEnable_DEF" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PowerSaverAutoEnable_NA" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowDelag" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "AllowDelag" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD\DXC" /v "AllowDelag" /t REG_SZ /d "0" /f

reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "LRTCEnable" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "3to2Pulldown" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "MosquitoNoiseRemoval_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "MosquitoNoiseRemoval" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Deblocking_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Deblocking" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "DemoMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "OverridePA" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "DynamicRange" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "StaticGamma_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "BlueStretch_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "BlueStretch" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "LRTCCoef" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "DynamicContrast_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "WhiteBalanceCorrection" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Fleshtone_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Fleshtone" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "ColorVibrance_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "ColorVibrance" /t REG_BINARY /d "340030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Detail_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Detail" /t REG_BINARY /d "310030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Denoise_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "Denoise" /t REG_BINARY /d "360034000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "TrueWhite" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "OvlTheaterMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "StaticGamma" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i" /v "InternetVideo" /t REG_BINARY /d "30000000" /f

reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "LRTCEnable" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "3to2Pulldown" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "MosquitoNoiseRemoval_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "MosquitoNoiseRemoval" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Deblocking_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Deblocking" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "DemoMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "OverridePA" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "DynamicRange" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "StaticGamma_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "BlueStretch_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "BlueStretch" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "LRTCCoef" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "DynamicContrast_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "WhiteBalanceCorrection" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Fleshtone_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Fleshtone" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "ColorVibrance_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "ColorVibrance" /t REG_BINARY /d "340030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Detail_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Detail" /t REG_BINARY /d "310030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Denoise_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "Denoise" /t REG_BINARY /d "360034000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "TrueWhite" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "OvlTheaterMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "StaticGamma" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD" /v "InternetVideo" /t REG_BINARY /d "30000000" /f

reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "LRTCEnable" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "3to2Pulldown" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "MosquitoNoiseRemoval_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "MosquitoNoiseRemoval" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Deblocking_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Deblocking" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "DemoMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "OverridePA" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "DynamicRange" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "StaticGamma_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "BlueStretch_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "BlueStretch" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "LRTCCoef" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "DynamicContrast_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "WhiteBalanceCorrection" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Fleshtone_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Fleshtone" /t REG_BINARY /d "350030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "ColorVibrance_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "ColorVibrance" /t REG_BINARY /d "340030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Detail_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Detail" /t REG_BINARY /d "310030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Denoise_ENABLE" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "Denoise" /t REG_BINARY /d "360034000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "TrueWhite" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "OvlTheaterMode" /t REG_BINARY /d "30000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "StaticGamma" /t REG_BINARY /d "3100300030000000" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\%%i\UMD\DXVA" /v "InternetVideo" /t REG_BINARY /d "30000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FS_PWR_MGMT_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FS_PWR_MGMT_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f

)
)
)

reg add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\CN" /v "AutoUpdateTriggered" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\CN" /v "CN_Hide_FeatureData" /t REG_SZ /d "true" /f
reg add "HKCU\Software\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f
reg add "HKCU\Software\AMD\CN" /v "SystemTray" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f
reg add "HKCU\Software\AMD\CN\Performance" /v "MetricsOverlayState" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\DVR" /v "HotkeysDisabled" /t REG_DWORD /d "1" /f

reg add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\ATI\ACE\Default\Settings\Runtime\Graphics\OverDrive5" /v "OverclockEnabled_NA" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\ATI\ACE\Default\Settings\Runtime\Graphics\OverDrive5" /v "OverclockEnabled_DEF" /t REG_SZ /d "True" /f

reg add "HKCU\Software\AMD\AIM" /v "LaunchBugTool" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\CN" /v "BuildType" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\AMD\CN\OverlayNotification" /v "AlreadyNotified" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\AMD\CN\VirtualSuperResolution" /v "AlreadyNotified" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\AMD\SCENE\0" /v "CameraEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\SCENE\1" /v "CameraEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\DVR" /v "CameraEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\AMD\DVR\DefaultScene" /v "CameraEnabled" /t REG_DWORD /d "0" /f

reg add "HKCU\Software\AMD\DVR" /v "ShowRSOverlay" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "RSXBrowserUnavailable" /t REG_SZ /d "true" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableeRecord" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Atierecord" /v "eRecordEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Atierecord" /v "eRecordEnablePopups" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_DVRSupport" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "StutterMode" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_OSControlsGPUPower" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHWCursor" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\AMD\AMDAnalytics" /v "AnalyticsAccepted" /t REG_SZ /d "false" /f
reg add "HKLM\SOFTWARE\WOW6432Node\AMD\AMDAnalytics" /v "AnalyticsAccepted" /t REG_SZ /d "false" /f

reg add "HKLM\SOFTWARE\AMD\Chill" /v "ProfileEnableDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\AMD\Chill" /v "GlobalEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\AMD\Chill" /v "ProfileEnableDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\AMD\Chill" /v "GlobalEnable" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableGpuFirmware" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableMClkSlowdown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "enableMultiHeadsGpuScalingOnTiledMonitor" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableNVClkSlowdown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ENABLE_OCA_LOGGING" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnablePerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableSystemMemoryTiling" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "enableVrrDisplayValidation" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "GlitchFreeMClk" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableGDIAcceleration" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "MaxPerfWithPerfMon" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NVDeviceSupportKFilter" /t REG_DWORD /d "0" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NVFBCEnable" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PCIEPowerControl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PCIEPowerControl_8086191f50001458" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PciLatencyTimerControl" /t REG_DWORD /d "0x00000020" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RM572548" /t REG_DWORD /d "1" /f

rem # alufena = 5
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RM2779240" /t REG_DWORD /d "5" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMAllowECCPageRetirementSLI" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMAsrWakeup" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMAssertOnEccErrors" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmBreak" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCacheLoc" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCeUseGen4Mapping" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCLFCDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmClkPowerOffDramPllWhenUnused" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMClkSlowDown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMCtxswLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableACPI" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableAsyncMemScrub" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableEDC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableFastScrubber" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableHdcp22" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableHwFaultBuffer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableInforomNvlink" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableInst2Sys" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableNoncontigAlloc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableOptimalPowerForPadlinkPll" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisablePerIntrDPCQueueing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableRamchainScrub" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableScrubOnFree" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableSwdxDirectCtxswScrub" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDwbMscg" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableASPMAtLoad" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableASPMDT" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmEnableHda" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableL1ECC" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmEnableNoiseAwarePll" /t REG_DWORD /d "0" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnablePowerSupplyCapacity" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableSHMECC" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableSMECC" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMFermiScreenTileRowOffset" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmForceDisableIomapWC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMGpcTileMap" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGpsPowerSteeringEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMaxFtuS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMinFtuS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcPerioduS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMGuestECCState" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmIgnoreHulkErrors" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMInitScrub" /t REG_DWORD /d "0" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrEiIdleThresholdUs" /t REG_DWORD /d "1" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmLpwrFgRppg" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrIdleThresholdUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrRgIdleThresholdUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrMsIdleThresholdUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMMaximizeBattery" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmMIONoPowerOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmNdivSliding" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMNoECCFBScrub" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMNoECCFuseCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmRcWatchdog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmRobustChannels" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSbiosEnableASPMDT" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSkipACPIBattCap" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSkipHdcp22Init" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSupportUserdMapDma" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMSystemCrashOnEccDBE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmWatchDogInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmWatchDogTimeOut" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmWotHdcpEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "UseUncachedPCIMappings" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ValidateBlitSubRects" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipDPCDelayUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipTimingMarginUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectJITFlipMsHybridFlipDelayUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrCursorMarginUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMarginUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMaxUs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableClockGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDynamicClockGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableULPS" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableIdlePowerSavings" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnablePowerThrottle" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableVoltageOptimizations" /t REG_DWORD /d "0" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableIntrIllegalCompstatAccess" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RM2644249" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmWar1760398" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCeElcgWar1895530" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMBug2519005War" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMEnableMSCGConfig" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmSec2EnableApm" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMCBAllocVPR" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmDisableFanDiag" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmPerPllProgramming" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGpsPreferIntrinsicFuncs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DISABLE_DSC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMAERRForceDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDisableRCOnDBE" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RM1441072" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMAERRHandling" /t REG_DWORD /d "0" /f



@echo off



echo.
echo ReBAR (Resizable BAR)
echo.
echo 1. ReBAR ON
echo 2. ReBAR OFF
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :zzzcep
) else if 2 EQU %ERRORLEVEL% (
   call :rebaroff
) else if 1 EQU %ERRORLEVEL% (
   call :rebaron
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:rebaron
echo User chose ReBAR ON

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableReBarForLegacyASIC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlSupport" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableReBarForLegacyASIC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RebarControlMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RebarControlSupport" /t REG_DWORD /d "1" /f

)
)
)

goto :end

:rebaroff
echo User chose ReBAR OFF

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableReBarForLegacyASIC" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlSupport" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_EnableReBarForLegacyASIC" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RebarControlMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "KMD_RebarControlSupport" /f

)
)
)

goto :end

:zzzcep
echo User chose SKIP

goto :end

:end

PAUSE