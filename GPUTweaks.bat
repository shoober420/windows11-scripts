rem # GPU Tweaks
rem # Works for any graphics card

rem # DOES NOT SUPPORT DIGITAL STREAM COMPRESSION (DSC). Black screen will occur if used with DSC monitors

rem # Timeout Detection and Recovery (TDR)
rem # Monitors and resets graphics cards that aren't responding quickly enough

rem # RECOMMENDED TO DISABLE ONBOARD INTEGRATED GPU IN BIOS AND DEVICE MANAGER AND USE DEDICATED GPU ONLY

rem # IMPROVE LATENCY AT THE COST OF LITTLE LESS FPS

rem # https://www.youtube.com/watch?v=fhrdDaLCrMo

rem # https://www.youtube.com/watch?v=OrOHQkOwZWs

rem # https://www.youtube.com/watch?v=itTcqcJxtbo

rem # https://www.youtube.com/watch?v=RWryKvdf_xo

rem # https://forums.blurbusters.com/viewtopic.php?t=13323

rem # https://sites.google.com/view/melodystweaks/basictweaks

rem # https://github.com/sherifmagdy32/gaming_os_tweaker/blob/main/scripts/tweaks/gpu.cmd

rem # Deferred Procedure Call
rem # Allows high-priority tasks to defer required but lower-priority tasks for later execution

PAUSE

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

rem # MAY CAUSE CRASHES
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "0" /f

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



reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableAGPSupport" /t REG_DWORD /d "1" /f

rem # Tell Windows to stop tolerating high DPC/ISR latencies
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExitLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f



reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemoryNoContext" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f

rem # DPC ISP Latency tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceIdleResiliency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MfBufferingThreshold" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f

rem # GPU Power Options
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "FlTransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "D3PCLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "1" /f

rem # melody / alufena = 0x00000020 (32)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PciLatencyTimerControl" /t REG_DWORD /d "0x00000020" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "UseGpuTimer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "F1TransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "FxAccountingTelemetryDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableIdleStatesAtBoot" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepstudyAccountingEnabled" /t REG_DWORD /d "0" /f


reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f



rem # DirectX Driver Service Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "CreateGdiPrimaryOnSlaveGPU" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DriverSupportsCddDwmInterop" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddSyncDxAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddSyncGPUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCddWaitForVerticalBlankEvent" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkCreateSwapChain" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkFreeGpuVirtualAddress" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkOpenSwapChain" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkShareSwapChainObject" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkWaitForVerticalBlankEvent" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "DxgkWaitForVerticalBlankEvent2" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "SwapChainBackBuffer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "TdrResetFromTimeoutAsync" /t REG_DWORD /d "1" /f


reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodPresentDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodVSyncDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseGpuTimer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlTransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3PCLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "1" /f

rem # melody / alufena = 0x00000020 (32)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PciLatencyTimerControl" /t REG_DWORD /d "0x00000020" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "F1TransitionLatency" /t REG_DWORD /d "1' /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f

rem # Direct3D Tweaks

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "EmulationOnly" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D\ReferenceDevice" /v "AllowAsync" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "AdaptiveVsyncEnable" /t REG_DWORD /d "0" /f

rem # alufena = 0x00001000 (4096)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "BuffersInFlight" /t REG_DWORD /d "4096" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableAsyncPstates" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGDIAcceleration" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRender" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableKmRenderBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverclockedPstates" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePFonDP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAggressivePStateOnly" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDirectFlip" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIndependentFlip" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePerformanceMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmClkPowerOffDramPllWhenUnused" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f

rem # alufena = 0
rem # WDDM2.3 IS DEPRECATED
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableWDDM23Synchronization" /t REG_DWORD /d "0" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UnsupportedMonitorModesAllowed" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseXPModel" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVersionMismatchCheck" /t REG_DWORD /d "1" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIgnoreWin32ProcessStatus" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableBadDriverCheckForHwProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableBoostedVSyncVirtualization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableIndependentVidPnVSync" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableMultiSourceMPOCheck" /t REG_DWORD /d "1" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFbrValidation" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "KnownProcessBoostMode" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableCABC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGpuTimeoutDetection" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVerticalBlankInterrupt" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverProtection" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DxgkWaitForIdle" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAdvancedMemoryTimings" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableGpuMemoryOvercommitment" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableOptimizedFlipQueue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceLowLatencyDisplayMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceOffScreenTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "lowdebounce" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MaxPreRenderedFrames" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "NumberOfIdleStates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "OPMSetProtectionLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PanelSelfRefresh" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PoFxPowerControl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PoFxStartDevicePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Protection" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ProtectionLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ReduceFrameLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SchedulingDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SupportRuntimePowerManagement" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PMMEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlipModel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFlipDiscard" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableDwmVSync" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AdjustWorkerThreadPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AudioDgAutoBoostPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "AutoSyncToCPUPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DebugLargeSmoothenedDuration" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "ForegroundPriorityBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "FrameServerAutoBoostPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "QueuedPresentLimit" /t REG_DWORD /d "1" /f



reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESOURCE_ALIGNMENT" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_MULTITHREADED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MULTITHREADED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_DEFERRED_CONTEXTS" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_DEFERRED_CONTEXTS" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ALLOW_TILING" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ENABLE_DYNAMIC_CODEGEN" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ALLOW_TILING" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_CPU_PAGE_TABLE_ENABLED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_HEAP_SERIALIZATION_ENABLED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MAP_HEAP_ALLOCATIONS" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESIDENCY_MANAGEMENT_ENABLED" /t REG_DWORD /d "1" /f

rem # Force contiguous memory allocation in the DirectX Graphics Kernel
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f

rem # Disable VSync control
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f

rem # DXGI Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "AllowDelayedFlips" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseDx" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseGpuForRender" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseTdx" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseThreadedOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseWddmForFullscreenVideo" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "UseSoftwareRender" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "SchedulingDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "SupportRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "RuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "Protection" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "ProtectionLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "OPMSetProtectionLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "NumberOfIdleStates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DriverProtection" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "PoFxStartDevicePowerManagement" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "PoFxPowerControl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DxgkWaitForIdle" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulatePointSprites" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulatePointSprites" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulatePointSprites" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulateStateBlocks" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "EmulateStateBlocks" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulateStateBlocks" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableDebugging" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "EnableDebugging" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "EnableDebugging" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FullDebug" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FullDebug" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FullDebug" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableDM" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableDM" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableDM" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableMultimonDebugging" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "EnableMultimonDebugging" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "EnableMultimonDebugging" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "LoadDebugRuntime" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "LoadDebugRuntime" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "LoadDebugRuntime" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumReference" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FewVertices" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableMMX" /t Reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableMMX" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMXFastPath" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "ForceNoSysLock" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableInactivate" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableInactivate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "DisableInactivate" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableNoSysLock" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\DirectDraw" /v "DisableNoSysLock" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "DisableNoSysLock" /t REG_DWORD /d "1" /f

rem # Disable Multi-GPU Selection
reg add "HKLM\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /t REG_DWORD /d "0" /f

rem # Environment Variables
rem # Chrome Launch Variables
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ANGLE_DISABLE_D3D11" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ANGLE_DISABLE_VULKAN" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CEF_DISABLE_GPU" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__COMPAT_LAYER" /t REG_SZ /d "DISABLEDXMAXIMIZEDWINDOWEDMODE DISABLEFADEANIMATIONS NOSHADOW NOPADDEDBORDER NOGHOST DISABLEANIMATION DISABLETHEMES DISABLETHEMEMENUS DISABLEDWM PERPROCESSSYSTEMDPIFORCEOFF" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DISABLE_DYNAMIC_FPS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableGPUTimeout" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_HIGH_SPEED_PRESENT" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGIFlipModel" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_FLIP_SEQUENTIAL" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_MAX_FRAME_LATENCY" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_LOW_LATENCY_MODE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxFramesToRenderAhead" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableAdaptiveSync" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableExclusiveFullScreen" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "EnableGameMode" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FlipEx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_GPU_TIMINGS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ForceThreadedRendering" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "HWACCEL" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "LatencyReductionMode" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MaxFPS" /t REG_SZ /d "999" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MaxPendingFrames" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseFastWindowFlip" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseLowLatencyInputDriver" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "UseNewScheduler" /t REG_SZ /d "1" /f

rem # Disable GPUPerf
reg delete "HKCR\WOW6432Node\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" /f
reg delete "HKCR\AppID\{cd93979b-c14e-4c29-87a4-75e4f9fa5e0a}" /f

reg add "HKLM\SOFTWARE\Microsoft\Direct2D" /v "EnableRect" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct2D" /v "Sharpness" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct2D" /v "DisableGammaCorrection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct2D" /v "DisableClearType" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "MaximumAllowedPreemptionDelay" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipOnVSyncHwFlipQueue" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipOnVSyncSwFlipQueue" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipImmediateHwFlipQueue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFlipImmediateSwFlipQueue" /t REG_DWORD /d "1" /f

rem # FREEZES SYSTEM WHEN ENABLED (1)
rem # Windows 10 / DEPRECATED
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableDirectSubmission" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableDirectSubmission" /t REG_DWORD /d "0" /f

rem # DECREASES FPS WHEN SET TO 1
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuedRenderPacketGroupLimit" /f
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuedRenderPacketGroupLimitPerNode" /f

rem # alufena = 2
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuedRenderPacketGroupLimit" /t REG_DWORD /d "2" /f

rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuedRenderPacketGroupLimitPerNode" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CLOUDSDK_CORE_DISABLE_PROMPTS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CONFIG_HZ" /t REG_SZ /d "FFFFFFFFFFFFFFFF" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DIRECT_CPU" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DIRECT_GPU" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOCKER_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOTNET_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOTNET_TRY_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ELECTRON_DISABLE_GPU" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ELECTRON_ENABLE_CPU_RENDERING" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "HZ" /t REG_SZ /d "FFFFFFFFFFFFFFFF" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "KERNEL_HZ" /t REG_SZ /d "FFFFFFFFFFFFFFFF" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MOZ_OMTC_ENABLED" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MOZ_USE_OMTC" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "VS_TELEMETRY_OPT_OUT" /t REG_SZ /d "1" /f



setx DXGL_FRAME_LATENCY_WAITABLE_OBJECT "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGL_FRAME_LATENCY_WAITABLE_OBJECT" /t REG_SZ /d "1" /f

setx DXGI_FRAME_LATENCY_WAITABLE_OBJECT "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_FRAME_LATENCY_WAITABLE_OBJECT" /t REG_SZ /d "1" /f

setx DXGI_SWAPCHAIN_FLUSH "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_SWAPCHAIN_FLUSH" /t REG_SZ /d "1" /f

setx GPU_MAX_ALLOC_PERCENT "100" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_ALLOC_PERCENT" /t REG_SZ /d "100" /f

setx GPU_SINGLE_ALLOC_PERCENT "100" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_SINGLE_ALLOC_PERCENT" /t REG_SZ /d "100" /f

setx DX12_AGGRESSIVE_PIPELINE "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX12_AGGRESSIVE_PIPELINE" /t REG_SZ /d "1" /f

setx DX12_FORCE_WARP "0" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX12_FORCE_WARP" /t REG_SZ /d "0" /f

setx GPU_SYNC_OBJECTS "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_SYNC_OBJECTS" /t REG_SZ /d "1" /f

setx GPU_MAX_HEAP_SIZE "100" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_HEAP_SIZE" /t REG_SZ /d "100" /f

setx GPU_FORCE_64BIT_PTR "0" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_FORCE_64BIT_PTR" /t REG_SZ /d "0" /f

setx DXGI_ALLOW_TEARING "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_ALLOW_TEARING" /t REG_SZ /d "1" /f

setx DXGI_PRESENT_ALLOW_TEARING "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_PRESENT_ALLOW_TEARING" /t REG_SZ /d "1" /f

setx DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "CHROME_HEADLESS" /t REG_SZ /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "DisableHWOverlay" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "AMD_ASYNC_SHADERS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "AMD_FORCE_LOW_LATENCY_MODE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_MULTITHREADED_OPTIMIZATIONS" /t REG_SZ /d "1" /f

rem # alufena = 0x00000080
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_MaxFrameBufferSize" /t REG_DWORD /d "0x00000080" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_USE_DXGI_FLIP_MODE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ENABLE_LOW_LATENCY_MODE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ENABLE_MEMORY_PREFETCH" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FAST_RESPONSE_MODE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FlipEx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_HIGH_PRIORITY_THREAD_SCHEDULING" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ForceThreadedRendering" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_MAX_FRAMES_ALLOWED" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_NO_SWAPLIMIT" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__GL_SYNC_TO_VBLANK" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ALLOW_HIGH_PRIORITY_TASKS" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ASYNC_COMPUTE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DEFERRED_RENDERING" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DISCARD_PENDING_WORK" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_DYNAMIC_PRIORITY" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_ENABLE_ASYNC_COMPUTE" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DX_ENABLE_MULTITHREADED_OPTIMIZATIONS" /t REG_SZ /d "1" /f

rem # alufena = 16
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_FRAME_TIME_LIMIT" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_FRAMERATE" /t REG_SZ /d "999" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_TASK_PRIORITY" /t REG_SZ /d "0" /f

rem # alufena = 512
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MAX_WORKGROUP_SIZE" /t REG_SZ /d "512" /f

rem # alufena = 64
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_MINIMUM_BATCH_SIZE" /t REG_SZ /d "64" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_USE_DEDICATED_MEMORY" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_USE_SHARED_MEMORY" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_WAIT_FOR_FLIP" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "GPU_WAIT_ON_SWAPCHAIN" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "npm_config_loglevel" /t REG_SZ /d "silent" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "NVIDIA_MULTI_DISPLAY_POWER_SAVER" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "NVIDIA_SINGLE_DISP_MEM_OPTIMIZATION" /t REG_SZ /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysUseDirectFlip" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AllowTearing" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "AwayModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemoryNoContext" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableThrottlingDuringGaming" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EcoMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnableIdleStates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ForceMaxPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "FxVsyncEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "IdleDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "IgnoreCsComplianceCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "OverrideMaxPerformance" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PowerThrottling" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ProcessorIdleDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "VideoIdleTimeout" /t REG_DWORD /d "0" /f


reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DCEInUseTelemetryDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "EnableRIMPnpThreadDelayBugcheck" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "RITdemonTimerPowerSaveCoalescing" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "RITdemonTimerPowerSaveElapse" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "TimerCoalescing" /t REG_BINARY /d "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f

rem # alufena = 2
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "CrtcPhaseFrames" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableAsyncShaderCompile" /t REG_DWORD /d "0" /f

rem # alufena = 1
rem # 1 CAUSES BLACK SCREEN AT SIGN IN
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableGdiContextGpuVa" /t REG_DWORD /d "0" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableMonitoredFenceGpuVa" /t REG_DWORD /d "1" /f

rem # alufena = 1
rem # 1 CAUSES BLACK SCREEN AT SIGN IN
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePagingContextGpuVa" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableSecondaryIFlipSupport" /t REG_DWORD /d "0" /f

rem # Virtual Address-backed Virtual Machine
rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVaBackedVm" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableVerticalBlankInterrupts" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverManagesResidencyOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DRTTestEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAcmSupportDeveloperPreview" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableBasicRenderGpuPv" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDecodeMPO" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableFuzzing" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableHMDTestMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIntegratedPanelAcmByault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableIntegratedPanelAcmByDefault" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableOfferReclaimOnDriver" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePanelFitterSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableTimedCalls" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExternalDiagnosticsBufferMultiplier" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ExternalDiagnosticsBufferSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Force32BitFences" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceAccessedPhysically" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceBddFallbackOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceEnableDWMClone" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceEnableDxgMms2" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceExplicitResidencyNotification" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceInitPagingProcessVaSpace" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceReplicateGdiContent" /t REG_DWORD /d "0" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d "1" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryIFlipSupport" /t REG_DWORD /d "0" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryMPOSupport" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSurpriseRemovalSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceToMapGpuVa" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceUsb4MonitorSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceVariableRefresh" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HighPriorityCompletionMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InternalDiagnosticsBufferMultiplier" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InternalDiagnosticsBufferSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "InvestigationDebugParameter" /t REG_DWORD /d "0" /f

rem # IOMMU-based GPU isolation
rem # Input-Output Memory Management Unit (IOMMU)
rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "IoMmuFlags" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "IsInternalRelease" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LimitNumberOfVfs" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MultiMonSupport" /t REG_DWORD /d "0" /f

rem # alufena = 0
rem # 0 DECREASES FPS
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "NodeUsageTelemetryTimerInterval" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "NumVirtualFunctions" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "OutputDuplicationSessionApplicationLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PageFaultDebugMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreserveFirmwareMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PreventFullscreenWireFormatChange" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RapidHPDThresholdCount" /t REG_DWORD /d "0" /f

rem # alufena = 1
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SmallQuantumMode" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SmallQuantumMode" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "SupportMultipleIntegratedDisplays" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TreatUsb4MonitorAsNormal" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Usb4MonitorPowerOnDelayInSeconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ValidateWDDMCaps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "VirtualGpuOnly" /t REG_DWORD /d "0" /f

rem # WDDM2+ Memory Management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "WDDM2LockManagement" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableFlipEx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableFramePacing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableHDASurfaces" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableIndependentFlip" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableSoftwarePaging" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableTiledResources" /t REG_DWORD /d "1" /f

rem # alufena = DELETED
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "EnableVariableRefresh" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "ReduceStalls" /t REG_DWORD /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CarryOverUsedQuantum" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CountFlipTowardHwLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "CountPresentTowardHwLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableFrameBufferCompression" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableGpuBoost" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HistoryLogSize" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "HwQueuePacketCap" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerSourceCustomDuration" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PfnCpuOverride" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "AffinitizeAllInterrupts" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "EnableMSI" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "ForceMSI" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "InterruptSteeringEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "LowLatencyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "MSIEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "PCIDelayTransaction" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "PCIPrefetchEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "UseMPSCap" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PnP\Pci" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\DisableDirectXDatabaseUpdate" /v "value" /t REG_DWORD /d "0" /f



rem # Intel iGPU Dedicated Segment Size
rem reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512" /f

PAUSE



rem # CAUSES STUTTERING WHEN SET TO 1
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PreemptionQuantumUnit" /f
rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "QuantumUnit" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PreemptionQuantumUnit" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "QuantumUnit" /t REG_DWORD /d "1" /f