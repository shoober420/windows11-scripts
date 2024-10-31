rem # AMD USERS: if screen flickering occurs, remove the "DalDramClockChangeLatencyNs" option from the script (line 217)

PAUSE

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

rem # Affinity tweak (dont use if you have less than 4 CPU cores)
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PciLatencyTimerControl" /t REG_DWORD /d "1" /f
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

rem # NVIDIA video card tweaks, last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used
rem # Second to last key is the "Class Guid"
rem # Find "Class Guid" under Device Manager > Display adapters > Properties > Details tab
rem # Example: "HKLM\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\0000"

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
		     reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
			 
			 rem # Disable HDCP
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
			 
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "D3PCLatency" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "F1TransitionLatency" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMaxFtuS" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcMinFtuS" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmGspcPerioduS" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrEiIdleThresholdUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrIdleThresholdUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrGrRgIdleThresholdUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMLpwrMsIdleThresholdUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipDPCDelayUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectFlipTimingMarginUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VRDirectJITFlipMsHybridFlipDelayUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrCursorMarginUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMarginUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "vrrDeflickerMaxUs" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TCCSupported" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Acceleration.Level" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DesktopStereoShortcuts" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NVDeviceSupportKFilter" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmCacheLoc" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "TrackResetEngine" /t REG_DWORD /d "0" /f
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ValidateBlitSubRects" /t REG_DWORD /d "0" /f
                   )
                )
             ) 

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "NVFBCEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73779" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73780" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID74361" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Services\NVDisplay.ContainerLocalSystem\LocalSystem\NvcDispCorePlugin" /v "DisableLoad" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\NVDisplay.ContainerLocalSystem\LocalSystem\NvcDispCorePlugin" /v "LogLevel" /t REG_DWORD /d "0" /f

rem # Disable NVIDIA Telemetry
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvDriverUpdateCheckDaily_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NVIDIA GeForce Experience SelfUpdate_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"

rem # Enable DPC'S for each Core
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f

rem # Disable NVIDIA WDDM TDR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrTestMode" /t REG_DWORD /d "0" /f

rem # AMD video card tweaks

rem # Last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (
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
			 rem # reg tweak DalDramClockChangeLatencyNs below can cause screen flickering, delete reg key if flickering occurs
			 reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalDramClockChangeLatencyNs" /t REG_DWORD /d "1" /f
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
                   )
                )
             )
			 
rem # IGPU Dedicated Segment Size
reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512"
			 
PAUSE
