rem # DOES NOT SUPPORT DIGITAL STREAM COMPRESSION (DSC). Black screen will occur if used of DSC monitors

rem # AMD USERS: if screen flickering occurs, remove the "DalDramClockChangeLatencyNs" option from the script (line 25)

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

rem # DalDramClockChangeLatencyNs below can cause screen flickering, delete reg key if flickering occurs

                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalDramClockChangeLatencyNs" /t REG_DWORD /d "1" /f

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
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f
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
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "StutterMode" /t REG_DWORD /d "0" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f
                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f
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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AAF_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSkins" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSnapshot" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowSubscription" /t REG_DWORD /d "0" /f
reg adf "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AntiAlias_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AreaAniso_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ASTT_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableUlps_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f
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

                   )
                )
             )

rem # IGPU Dedicated Segment Size
reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512"

PAUSE