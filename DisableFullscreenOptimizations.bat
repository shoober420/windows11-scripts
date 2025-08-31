rem # Disable Fullscreen Optimizations (FSO)

rem # https://learn.microsoft.com/en-us/answers/questions/3741077/fullscreen-optimizations-windows-registry?forum=windows-all&referrer=answers

rem # https://en.ittrip.xyz/windows10/registry-tweaks-gamedvr#google_vignette

rem # https://youtu.be/JUXEr5QsaCc?si

rem # DirectX 12 Ultimate (12_2) requires GeForce RTX 20/30 or newer and Radeon RX 6000 or newer

rem # Check MPO support using DXDiag > "Save All Information" and looking in DxDiag.txt file
rem # MPO MaxPlanes should be 1+ if MPO is enabled
rem # MPO Caps, MPO Stretch, MPO Media Hints, MPO Formats, PanelFitter Caps, and PanelFitter Stretch will say "Not Supported" if MPO is disabled

rem # Check Flip Mode with PresentMon
rem # https://github.com/GameTechDev/PresentMon

rem # https://wiki.special-k.info/Presentation_Model

rem # Fullscreen Exclusive (FSE)
rem # Enhanced Fullscreen Exclusive (EFSE)
rem # Desktop Screen Experience (DSE)
rem # Multiplane Overlay (MPO)



rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)



rem # 0 = FSO: ON / FSE: ON
rem # 2 = FSO: OFF / FSE: ON
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f

rem # Honor User adjusted FSE value
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f



rem # Enable Enhanced Fullscreen Exclusive (EFSE)

rem # Bit 0: Enables/disables EFSE mode entirely
rem # Bit 1: Controls DXGI flip model swap chains in EFSE (lower latency when enabled)
rem # Bit 2: Toggles DXGI swap chain scaling (DISABLE)
rem # Bit 3: Switches DXGI swap chain color space (required for HDR)
rem # Bit 4: Enables/disables HDR metadata support for EFSE (required for HDR)
rem # Bit 5: Manages overlay support in EFSE

rem # 0 = Disable EFSE
rem # 0x01 / 00000001 = Enable ONLY EFSE
rem # 0x03 / 00000011 = Enable EFSE + Flip Model
rem # 0x07 / 00000111 = Enable EFSE + Flip Model + Scaling
rem # 0xf / 00001111 = Enable EFSE + Flip Model + Scaling + Color Space
rem # 0x1f / 00011111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata
rem # 0x3f / 00111111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata + Overlay
rem # 0x3b / 00111011 = Enable EFSE + Flip Model + Color Space + HDR metadata + Overlay

reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f



rem # Disable more FSO features
rem # Disable Color Management
rem # Disable GameDVR recording
rem # 0 = Enable More FSO Features / 1 = Disable FSO Features
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f

rem # Disable GameDVR Overlay
rem # ON = 0 / OFF = 2
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehaviorMode" /t REG_DWORD /d "2" /f

rem # Honor User adjusted DSE value
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserDSEBehaviorMode" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableFullScreenOptimizations" /t REG_DWORD /d "1" /f



rem # MPO and FSO NEED TO BE ENABLED FOR "HARDWARE COMPOSED: INDEPENDENT FLIP"

rem # "Hardware Composed: Independent Flip" = rendering buffer is directly scanned out to the display, bypassing the Desktop Window Manager (DWM) composition for improved performance

rem # "Hardware: Legacy Flip" used when FSO is DISABLED

rem # Disable Multiplane Overlay (MPO)
reg add "HKLM\SYSTEM" /v "OverlayTestMode" /t REG_DWORD /d "5" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "OverlayTestMode" /t REG_DWORD /d "5" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "5" /f

rem # Disable optimizations for windowed games

call DisableHDR.bat



@echo off



echo.
echo
echo.
echo 1. Disable AMD SwapEffect (DXGI_SWAP_EFFECT_FLIP_DISCARD)
echo 2. SKIP
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :sccippl
) else if 1 EQU %ERRORLEVEL% (
   call :amdswap
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:amdswap
echo User chose Disable AMD SwapEffect (DXGI_SWAP_EFFECT_FLIP_DISCARD)

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL" /t REG_BINARY /d "3000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL_NA" /t REG_SZ /d "0" /f

)
)
)

goto :end

:sccippl
echo User chose SKIP

goto :end

:end

PAUSE