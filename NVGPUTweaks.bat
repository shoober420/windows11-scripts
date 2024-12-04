rem # DOES NOT SUPPORT DIGITAL STREAM COMPRESSION (DSC). Black screen will occur if used of DSC monitors

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

rem # NVIDIA video card tweaks, last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used
rem # Second to last key is the "Class Guid"
rem # Find "Class Guid" under Device Manager > Display adapters > Properties > Details tab
rem # Example: "HKLM\SYSTEM\CurrentControlSet\Control\Class\"Class Guid"\0000"

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (

rem # Disable HDCP
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f

		  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
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

    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisablePFonDP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "AdaptiveVsyncEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "BuffersInFlight" /t REG_DWORD /d "4096" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ComputePreemptionLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "ComputePreemption" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableAcpPowerGating" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v DisableAllClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableAsyncPstates /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableBlockWrite /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableCpPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableCudaContextPreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDMACopy /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDrmdmaPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDynamicPstate /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGDIAcceleration /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGDSPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGfxCGPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGfxClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGFXPipelinePowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGmcPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableHdpClockPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableHdpMGClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableKmRender /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableKmRenderBoost /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableOverclockedPstates /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePreemptionOnS3S4 /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableSamuClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableSysClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableUVDPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableVceClockGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableWriteCombining /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableXdmaPowerGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableXdmaSclkGating /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v Disable_OverlayDSQualityEnhancement /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DpiMapIommuContiguous /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAggressivePStateBoost /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAggressivePStateOnly /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAsyncMidBufferPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableCEPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableDirectFlip /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableIndependentFlip /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidBufferPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidBufferPreemptionForHighTdrTimeout /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidGfxPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidGfxPreemptionVGPU /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnablePerformanceMode /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnablePreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableRuntimePowerManagement /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableSCGMidBufferPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableUlps /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableVCNPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v FlTransitionLatency /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v GPUPreemptionLevel /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableComputePreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableGfxMidCmdPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnablePreemptionLogging /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableSDMAPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_PreemptionLevelLimit /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v MonitorLatencyTolerance /t REG_DWORD /d 1000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 2710 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PerfAnalyzeMidBufferPreemption /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PowerSavingTweaks /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_SclkDeepSleepDisable /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_ThermalAutoThrottlingEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PrimaryPushBufferSize /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmClkPowerOffDramPllWhenUnused /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDeepLlEntryLatencyUsec /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDisablePostL2Compression /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableRegistryCaching /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmFbsrPagedDMA /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmGpsPsEnablePerCpuCoreDpc /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v StutterMode /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v UseGpuTimer /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableOverlay /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableSystemMemoryTiling /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableTiledDisplay /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v ENABLE_OCA_LOGGING /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PCIEPowerControl /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PCIEPowerControl_8086191f50001458 /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMClkSlowDown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDisableGpuASPMFlags /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableHdcp22 /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMEnableASPMAtLoad /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMEnableASPMDT /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmMIONoPowerOff /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmPerfRatedTdpLimit /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMSkipHdcp22Init /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmWotHdcpEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v F1TransitionLatency /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDeepL1EntryLatencyUsec /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableCoreSlowdown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMClkSlowdown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableNVClkSlowdown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableHwFaultBuffer /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableGDIAcceleration /t REG_DWORD /d 1 /f



rem # NVIDIA HD audio tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v ConservationIdleTime /t REG_DWORD /d 00000000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v IdlePowerState /t REG_DWORD /d 00000000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v PerformanceIdleTime /t REG_DWORD /d 00000000 /f
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
rem # May cause crashing and freezing
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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodPresentDelay" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDodVSyncDelay" /t REG_DWORD /d 0 /f
			 
rem # IGPU Dedicated Segment Size
reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512"

rem # Disable NVIDIA tray icon
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvTray" /v "StartOnLogin" /t REG_DWORD /d 0 /f

rem # Use Advanced 3D Settings
REG ADD "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "Gestalt" /t REG_DWORD /d 2 /f

rem # Use NVIDIA Old Sharpening Filter
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v "EnableGR535" /t REG_DWORD /d 0 /f

PAUSE
