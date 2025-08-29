rem # Desktop Window Wanager (DWM) Tweaks

rem # jdallmann
rem # Kizzimo

rem # https://github.com/AlchemyTweaks/Verified-Tweaks/blob/main/DWM/DWMAdjustablesd-jdallmann.bat
rem # https://github.com/AlchemyTweaks/Verified-Tweaks/blob/main/DWM/DWMImmediateRender-Kizzimo.bat
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://forums.blurbusters.com/viewtopic.php?f=10&t=14501
rem # https://djdallmann.github.io/GamingPCSetup/CONTENT/RESEARCH/FINDINGS/registrykeys_dwm.txt

rem # https://youtu.be/JUXEr5QsaCc?si

rem # Check Flip Mode with PresentMon
rem # https://github.com/GameTechDev/PresentMon

rem # https://wiki.special-k.info/Presentation_Model



rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)



rem # Enable Independent Flip
rem # Optimization technique for games that support "flip model" swapchains
rem # Bypass some DWM composition, resulting in lower latency and better performance
rem # LIMITS FPS TO REFRESH RATE IN SOME GAMES WHEN SET TO 1 (Marvel Rivals)
rem # BREAKS LOSSLESS SCALING PROGRAM WHEN SET TO 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableIndependentFlip" /t REG_DWORD /d "0" /f

rem # Enable Advanced Direct Flip
rem # Bypass some DWM composition, resulting in lower latency and better performance
rem # Kizzimo = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableAdvancedDirectFlip" /t REG_DWORD /d "0" /f

rem # Kizzimo = 0
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxD3DFeatureLevel" /t REG_DWORD /d "0" /f
rem reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxD3DFeatureLevel" /f

rem # Disable Non Draw List Rendering
rem # Non Draw List rendering = Immediate mode (LEGACY)
rem # Draw List Rendering = Retained mode (MODERN)
rem # jdallmann = 1
rem # tweakradje = 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisallowNonDrawListRendering" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\WINDOWS\DWM" /v "DisallowNonDrawListRendering" /t REG_DWORD /d "1" /f

rem # Enable Draw List Caching
rem # Kizzimo / blurbusters = 1
rem # tweakradje = 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableDrawListCaching" /t REG_DWORD /d "0" /f

rem # Disable DWM Effects Caching
rem # Kizzimo / blurbusters = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableEffectCaching" /t REG_DWORD /d "1" /f

rem # Used for VR
rem # jdallmann / tweakradje = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableHologramCompositor" /t REG_DWORD /d "1" /f

rem # Disable CPU Clipping
rem # Process is intentionally limited in its CPU usage to prevent it from consuming excessive resources
rem # Kizzimo / jdallmann = 1
rem # tweakradje = 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableCpuClipping" /t REG_DWORD /d "0" /f

rem # Disable DWM Back Buffer (Double Buffering)
rem # Offscreen buffer (back buffer) is drawn and then composited to the screen (front buffer)
rem # This process is crucial for visual effects like transparency and animations
rem # tweakradje = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableDrawToBackbuffer" /t REG_DWORD /d "1" /f

rem # tweakradje = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableImageProcessing" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableMPCPerfCounter" /t REG_DWORD /d "0" /f

rem # tweakradje = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableShadow" /t REG_DWORD /d "0" /f

rem # WARP (Windows Advanced Rasterization Platform)
rem # Software rendering if hardware acceleration isn't available
rem # Kizzimo / tweakradje / blurbusters = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "UseHWDrawListEntriesOnWARP" /t REG_DWORD /d "1" /f

rem # https://learn.microsoft.com/en-us/windows-hardware/drivers/display/what-s-new-for-prior-wddm-2-x-versions#wddm-26
rem # https://commercial.screenbeam.com/support/super-wet-ink-touch-latency-on-new-intel-gpu-drivers-causes-system-freeze
rem # jdallmann = 1
rem # tweakradje = 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "SuperWetEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "SuperWetExtensionTimeMicroseconds" /t REG_DWORD /d "0" /f

rem # tweakradje = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ImageProcessing8bit" /t REG_DWORD /d "0" /f

rem # 1f4?
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "TelemetryFramesSequenceMaximumPeriodMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "TelemetryFramesSequenceIdleIntervalMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "TelemetryFramesReportPeriodMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "RecurringWatchdogTelemetryTimeoutMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "InitialWatchdogTelemetryTimeoutMilliseconds" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ForceDirectDrawSync" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DDisplayTestMode" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DebugFailFast" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\WINDOWS\DWM" /v "DebugFailFast" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MarshalAllDebugInfo" /t REG_DWORD /d "0" /f

rem # Kizzimo / jdallmann = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableDeviceBitmaps" /t REG_DWORD /d "1" /f

rem # Enable Locking Memory
rem # Memory Locking guarantees that a process's memory remains readily accessible, preventing delays caused by paging
rem # jdallmann = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableLockingMemory" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableProjectedShadowsRendering" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableProjectedShadows" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableRenderPathTestMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "FlattenVirtualSurfaceEffectInput" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "InkGPUAccelOverrideVendorWhitelist" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "InteractionOutputPredictionDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MPCInputRouterWaitForDebugger" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OneCoreNoDWMRawGameController" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "BackdropBlurCachingThrottleMs" /t REG_DWORD /d "0" /f

rem # jdallmann / Kizzimo = 1
rem # tweakradje = 0
rem # Used for visual effects
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ResampleInLinearSpace" /t REG_DWORD /d "0" /f

rem # jdallmann = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "SDRBoostPercentOverride" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "AnimationAttributionEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "AnimationAttributionHashingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "AnimationsShiftKey" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableCommonSuperSets" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableDesktopOverlays" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableFrontBufferRenderChecks" /t REG_DWORD /d "0" /f

rem # Disable MegaRects
rem # Identifies rectangular areas (rects) that need to be updated and only redraws those
rem # Kizzimo / blurbusters = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableMegaRects" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MegaRectSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MegaRectSearchCount" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnablePrimitiveReordering" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableResizeOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OptimizeForDirtyExpressions" /t REG_DWORD /d "1" /f

rem # High Color = 16bit color
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "HighColor" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayQualifyInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayQualifyCount" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayDisqualifyInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayDisqualifyCount" /t REG_DWORD /d "0" /f

rem # Kizzimo / blurbusters = 1
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ParallelModePolicy" /t REG_DWORD /d "1" /f
rem reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ParallelModePolicy" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ParallelModeLeaveAfterThresholdMS" /t REG_DWORD /d "0" /f

rem # Kizzimo / blurbusters = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ResampleModeOverride" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "RenderThreadWatchdogTimeoutMilliseconds" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ResizeTimeoutGdi" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ResizeTimeoutModern" /t REG_DWORD /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "Blur" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisableAccentGradient" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisallowColorizationColorChanges" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisallowFlip3d" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "OneCoreNoBootDWM" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisableAccentGradient" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisallowColorizationColorChanges" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisallowFlip3d" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "OneCoreNoBootDWM" /t REG_DWORD /d "1" /f

rem # Disable Display Mode Change Animation
reg add "HKLM\Software\Microsoft\Windows\Dwm" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableDeviceBitmapsForMultiAdapter" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "DisableDynamicShutdownUI" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "LogExpressionPerfStats" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MouseWheelScrollingMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MousewheelAnimationDurationMs" /t REG_DWORD /d "0" /f

rem # Disable DWM Input
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DwmInputUsesIoCompletionPort" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "EnableDwmInputProcessing" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowFlip3d" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowColorizationColorChanges" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ChildWindowDpiIsolation" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DWM_MAXIMUM_BUFFER_AGE" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DWM_TRIPLE_BUFFER" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DWM_BUFFER_COUNT" /t REG_DWORD /d "1" /f

rem # kizzimo = 0x99999999
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "FrameDisplayBaseNegOffsetNS" /t REG_DWORD /d "0" /f

rem # kizzimo = 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "FrameDisplayResDivValue" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "m_bufferCount" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "LingerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "LicenseInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "DisableSpecificPopups" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "DisableExpirationPopups" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM\Schedule" /v "HideBalloonNotification" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayMinFPS" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "BufferCount" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxBufferCount" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxOutstandingFrames" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "IdleTimeout" /t REG_DWORD /d "0" /f



rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking

rem # Default 0x2d (45)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateThresholdPercent" /t REG_DWORD /d "0x0" /f



@echo off


echo.
echo DWM Composition
echo.
echo 1. DWM Composition ON (VERY SMOOTH)
echo 2. DWM Composition OFF (LOWER LATENCY)
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :compoff
) else if 1 EQU %ERRORLEVEL% (
   call :compon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:compon
echo User chose DWM Composition ON (VERY SMOOTH)

rem # Enable DWM Composition
rem # CompositionPolicy: 1 = DWM OFF / 0 = DWM ON
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "Composition" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "0" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDWM" /t REG_SZ /d "0" /f

)
)
)

goto :end

:compoff
echo User chose DWM Composition OFF (LOWER LATENCY)

rem # Disable DWM Composition
rem # CompositionPolicy: 1 = DWM OFF / 0 = DWM ON
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "Composition" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "CompositionPolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisableDWM" /t REG_DWORD /d "1" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DisableDWM" /t REG_SZ /d "1" /f

)
)
)

goto :end

:end



echo.
echo RADEON DWM Composition
echo.
echo 1. RADEON DWM Composition ON (VERY SMOOTH)
echo 2. RADEON DWM Composition OFF (LOWER LATENCY)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :radskip
) else if 2 EQU %ERRORLEVEL% (
   call :compoff
) else if 1 EQU %ERRORLEVEL% (
   call :compon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:compon
echo User chose RADEON DWM Composition ON (VERY SMOOTH)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableDWM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableDWM" /t REG_DWORD /d "0" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableDWM" /t REG_SZ /d "0" /f

)
)
)

goto :end

:compoff
echo User chose RADEON DWM Composition OFF (LOWER LATENCY)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableDWM" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableDWM" /t REG_DWORD /d "1" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DisableDWM" /t REG_SZ /d "1" /f

)
)
)

goto :end

:radskip
echo User chose SKIP

goto :end

:end



echo.
echo Frame Latency
echo.
echo 1. FrameLatency: 1 (ULTRA FAST SYSTEM ONLY)
echo 2. FrameLatency: 2
echo 3. FrameLatency: 3 (SLOW COMPUTER) (VERY SMOOTH)
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :latency3
) else if 2 EQU %ERRORLEVEL% (
   call :latency2
) else if 1 EQU %ERRORLEVEL% (
   call :latency1
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:latency1
echo User chose FrameLatency: 1 (ULTRA FAST SYSTEM ONLY)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "FrameLatency" /t REG_DWORD /d "1" /f

goto :end

:latency2
echo User chose FrameLatency: 2

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "FrameLatency" /t REG_DWORD /d "2" /f

goto :end

:latency3
echo User chose FrameLatency: 3 (SLOW COMPUTER) (VERY SMOOTH)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "FrameLatency" /t REG_DWORD /d "3" /f

goto :end

:end



echo.
echo Max Queued Present Buffers
echo.
echo 1. MaxQueuedPresentBuffers: 0 (ULTRA FAST SYSTEM ONLY)
echo 2. MaxQueuedPresentBuffers: 1 (RECOMMENDED) (MOST USED TWEAKED VALUE)
echo 3. MaxQueuedPresentBuffers: 2
echo 4. MaxQueuedPresentBuffers: 3 (VERY SMOOTH)
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :buff3
) else if 3 EQU %ERRORLEVEL% (
   call :buff2
) else if 2 EQU %ERRORLEVEL% (
   call :buff1
) else if 1 EQU %ERRORLEVEL% (
   call :buff0
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:buff0
echo User chose MaxQueuedPresentBuffers: 0 (ULTRA FAST SYSTEM ONLY)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxQueuedPresentBuffers" /t REG_DWORD /d "0" /f

goto :end

:buff1
echo User chose MaxQueuedPresentBuffers: 1 (RECOMMENDED) (MOST USED TWEAKED VALUE)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxQueuedPresentBuffers" /t REG_DWORD /d "1" /f

goto :end

:buff2
echo User chose MaxQueuedPresentBuffers: 2

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxQueuedPresentBuffers" /t REG_DWORD /d "2" /f

goto :end

:buff3
echo User chose MaxQueuedPresentBuffers: 3

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "MaxQueuedPresentBuffers" /t REG_DWORD /d "3" /f

goto :end

:end



rem # ExclusiveModeFramerateAveragingPeriodMs
rem # low values (100 / 0x64) decrease fps for lower input latency, high values (1000 / 0x3e8) increase fps for higher input latency

rem # Too low of a value can cause game freezing

rem # Can be set lower when using SetTimerResolution -5000 (0.5ms)

rem # Default (Hex / Decimal): 0x3e8 = 1000
rem # 0x2ee = 750 (FAST SYSTEM ONLY)
rem # 0x1f4 = 500 (VERY FAST SYSTEM ONLY)
rem # 0xfa = 250 (VERY VERY FAST SYSTEM ONLY)
rem # 0x64 = 100 (ULTRA FAST SYSTEM ONLY)

echo.
echo Exclusive Mode Framerate Averaging Period Ms
echo.
echo 1. ExclusiveModeFramerateAveragingPeriodMs: 0x64 = 100 (ULTRA FAST SYSTEM ONLY) (LOWER LATENCY)
echo 2. ExclusiveModeFramerateAveragingPeriodMs: 0xfa = 250
echo 3. ExclusiveModeFramerateAveragingPeriodMs: 0x1f4 = 500
echo 4. ExclusiveModeFramerateAveragingPeriodMs: 0x2ee = 750
echo 5. ExclusiveModeFramerateAveragingPeriodMs: 0x3e8 = 1000 (VERY SMOOTH) (DEFAULT)
echo C. Cancel
echo.
choice /c 12345C /m "Choose an option :"

if 6 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 5 EQU %ERRORLEVEL% (
   call :period5
) else if 4 EQU %ERRORLEVEL% (
   call :period4
) else if 3 EQU %ERRORLEVEL% (
   call :period3
) else if 2 EQU %ERRORLEVEL% (
   call :period2
) else if 1 EQU %ERRORLEVEL% (
   call :period1
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:period1
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x64 = 100 (ULTRA FAST SYSTEM ONLY) (LOWER LATENCY)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x64" /f

goto :end

:period2
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0xfa = 250

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0xfa" /f

goto :end

:period3
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x1f4 = 500

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x1f4" /f

goto :end

:period4
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x2ee = 750

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x2ee" /f

goto :end

:period5
echo User chose ExclusiveModeFramerateAveragingPeriodMs: 0x3e8 = 1000 (VERY SMOOTH) (DEFAULT)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "ExclusiveModeFramerateAveragingPeriodMs" /t REG_DWORD /d "0x3e8" /f

goto :end

:end



echo.
echo DWM DPI Scaling
echo.
echo 1. UseDPIScaling: 0 (MORE ACCURATE MOUSE MOVEMENT) (BLURRY FONTS)
echo 2. UseDPIScaling: 1 
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :dpi1
) else if 1 EQU %ERRORLEVEL% (
   call :dpi0
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:dpi0
echo User chose UseDPIScaling: 0 (MORE ACCURATE MOUSE MOVEMENT) (BLURRY FONTS)

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "UseDPIScaling" /t REG_DWORD /d "0" /f

goto :end

:dpi1
echo User chose UseDPIScaling: 1

reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "UseDPIScaling" /t REG_DWORD /d "1" /f

goto :end

:end

PAUSE

