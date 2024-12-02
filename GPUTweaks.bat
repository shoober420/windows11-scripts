rem # DOES NOT SUPPORT DIGITAL STREAM COMPRESSION (DSC). Black screen will occur if used of DSC monitors

PAUSE

rem # Sources: https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker/blob/main/scripts/tweaks/gpu.cmd

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem # GPU tweaks for any graphics card

rem # SwapEffectUpgradeEnable = Optimizations for windowed and borderless windowed games
rem # HighPerfAdapter must match Hardware ID in Device Manager for GPU
rem # Device Manager > Display Adapters > "GPUNAME" > Properties > Details > Property > Hardware Ids
rem # HighPerfAdapter="VEN&DEV&SUBSYS" / PCI\VEN_10DE&DEV_2684&SUBSYS_89321043 / HighPerfAdapter=10DE&2684&89321043

rem reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=10DE&2684&89321043;VRROptimizeEnable=0;AutoHDREnable=1;SwapEffectUpgradeEnable=1" /f

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/find-gpu-ven-dev-subsys-values-for-highperfadapter-option-using-wmic-or-other-method.30127/post-521164

for /f "tokens=1-6 delims=_&" %%a in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr PCI') do (
    reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=%%b&%%d&%%f;VRROptimizeEnable=0;AutoHDREnable=1;SwapEffectUpgradeEnable=1" /f 
)

rem # Affinity tweak
rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/wmic-query-cpu-core-count-to-execute-setting.30155/post-521450

for /f "tokens=2 delims=^=" %%f in ('wmic cpu get NumberOfCores /value ^| find "="') do set Cores=%%f

if %Cores% gtr 4 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "3" /f
)

rem # Enable MSI Mode for GPU
rem # Program: http://www.mediafire.com/file/ewpy1p0rr132thk/MSI_util_v3.zip/file
rem # Device Manager > Display Adapters > "GPUNAME" > Properties > Details > Property > Device instant path
rem # HKLM\SYSTEM\CurrentControlSet\Enum\PCI\"Device instant path"
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "FlTransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "D3PCLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodPresentDelay" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodVSyncDelay" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseGpuTimer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlTransitionLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3PCLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "F1TransitionLatency" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d 1 /f

rem # DirectX Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\ReferenceDevice" /v "AllowAsync" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AllowDeepCStates" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AdaptiveVsyncEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "BuffersInFlight" /t REG_DWORD /d 4096 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ComputePreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ComputePreemptionLevel" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableAsyncPstates" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableCudaContextPreemption" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableDynamicPstate" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGDIAcceleration" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRender" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRenderBoost" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverclockedPstates" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePFonDP" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePreemption" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateBoost" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateOnly" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableCEPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDirectFlip" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIndependentFlip" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePerformanceMode" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "GPUPreemptionLevel" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmClkPowerOffDramPllWhenUnused /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmFbsrPagedDMA" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableWDDM23Synchronization" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f


PAUSE