rem # AMD GPU Tweaks
rem # Works on AMD/ATI GPUs ONLY
rem # Also use on AMD/NVIDIA combo laptops

rem # DOES NOT SUPPORT DIGITAL STREAM COMPRESSION (DSC). Black screen will occur if used with DSC monitors

rem # RECOMMENDED TO DISABLE ONBOARD INTEGRATED GPU IN BIOS AND DEVICE MANAGER AND USE DEDICATED GPU ONLY

rem # IMPROVE LATENCY AT THE COST OF LITTLE LESS FPS

PAUSE

rem # Sources:
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker

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

rem # Pre-rendered Frames=FlipQueueSize (DX9) | Main3D and Main3D_DEF (DX10+) / 3100=1 3200=2 3300=3300 (DEFAULT)
rem # 3000=0 will use the default 3 value
rem # 1=BEST LATENCY 2+=BEST FPS

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f

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
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3D_Refresh_Rate_Override_DEF" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSnapshot" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSubscription" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSkins" /t REG_SZ /d "false" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisablePowerGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableVceSwClockGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUvdClockGating" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
                         
rem # Shader Cache / 3000=OFF 3100=OPTIMIZED 3200=ALWAYS ON

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f

                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option"" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "1" /f

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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3D_Refresh_Rate_Override_DEF" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "3to2Pulldown_NA" /t REG_DWORD /d "0" /f
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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableComputePreemption" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableReBarForLegacyASIC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RebarControlSupport" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DynamicContrast_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "hotkeys_ui_component_na" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "imagesharpening_runtime_component_na" /t REG_SZ /d "false" /f

rem # Radeon Chill Power Saving
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_ChillEnabled" /t REG_DWORD /d "0" /f

rem # Radeon Anti-Lag
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f

rem # Image Sharpening
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_USUEnable" /t REG_DWORD /d "0" /f

rem # Frame Limiter
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f

rem # Radeon Boost
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "powermanagement_delag_component_na" /t REG_SZ /d "false" /f

rem # Super Resolution
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "radeon_superresolution_ui_component_na" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "CameraShakeMotionDetect_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "chill_component_na" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "color_enhancement_runtime_component_na" /t REG_SZ /d "false" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoTuneRequest_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DDC2Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DVRTrackingEnabledBuild" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DisableVariableRefreshRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_TdrDelay" /t REG_DWORD /d "0" /f


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
reg add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\AMD\DVR" /v "HotkeysDisabled" /t REG_DWORD /d "1" /f

reg add "HKLM\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\ATI\ACE\Default\Settings\Runtime\Graphics\OverDrive5" /v "OverclockEnabled_DEF" /t REG_SZ /d "True" /f



PAUSE