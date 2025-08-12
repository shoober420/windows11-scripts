rem # Enable AMDGPU DalDramClockChangeLatencyNs tweak

rem # !!! WARNING !!!

rem # DalDramClockChangeLatencyNs tweak can cause screen flickering

rem # VSYNC ENABLED INCREASES CHANCES OF FLICKERING

rem # Run DisableAMD_DalDramClockChangeLatencyNs.bat to fix

rem # !!! WARNING !!!

PAUSE

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem # Last key may vary from 0000 to 0001 if dual NVIDIA/AMD machine is used

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalDramClockChangeLatencyNs" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "DalDramClockChangeLatencyNs" /t REG_DWORD /d "1" /f

                   )
                )
             )

PAUSE
