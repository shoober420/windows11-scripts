rem # Desktop Window Wanager (DWM) Tweaks

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableDrawListCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableHologramCompositor" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisallowNonDrawListRendering" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableCpuClipping" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableDrawToBackbuffer" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableImageProcessing" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableMPCPerfCounter" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableShadow" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "UseHWDrawListEntriesOnWARP" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "SuperWetEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ImageProcessing8bit" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "TelemetryFramesSequenceMaximumPeriodMilliseconds" /t REG_DWORD /d "1000" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ForceDirectDrawSync" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "FrameLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "MaxQueuedPresentBuffers" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DDisplayTestMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DebugFailFast" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableDeviceBitmaps" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableLockingMemory" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableProjectedShadowsRendering" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableProjectedShadows" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableRenderPathTestMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "FlattenVirtualSurfaceEffectInput" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "InkGPUAccelOverrideVendorWhitelist" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "InteractionOutputPredictionDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "MPCInputRouterWaitForDebugger" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "OneCoreNoDWMRawGameController" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ResampleInLinearSpace" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "SDRBoostPercentOverride" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "AnimationAttributionEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "AnimationsShiftKey" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableAdvancedDirectFlip" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableCommonSuperSets" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableDesktopOverlays" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableEffectCaching" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableFrontBufferRenderChecks" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableMegaRects" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnablePrimitiveReordering" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableResizeOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "HighColor" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "MaxD3DFeatureLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "OverlayQualifyCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "OverlayDisqualifyCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ParallelModePolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ResampleModeOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "RenderThreadWatchdogTimeoutMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ResizeTimeoutGdi" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "ResizeTimeoutModern" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "1000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\ExtendedComposition" /v "ExclusiveModeFramerateThresholdPercent" /t REG_DWORD /d "45" /f

rem # Disable Multi-Plane Overlay (MPO)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "5" /f

rem # Disable DWM Input
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DwmInputUsesIoCompletionPort" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "EnableDwmInputProcessing" /t REG_DWORD /d "0" /f

rem # Disable Display Mode Change Animation
reg add "HKLM\Software\Microsoft\Windows\Dwm" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d "1" /f

PAUSE
