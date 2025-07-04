rem # NVIDIA DSC Tweak

rem # Digital Screen Compression / Display Stream Compression (DSC)

rem # https://github.com/Batleman
rem # https://github.com/shoober420/windows11-scripts/issues/6

rem # Black screen will occur if used with DSC monitors and "EnableTiledDisplay" is disabled (0)

PAUSE

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt



@echo off

echo.
echo NVIDIA DSC Tweak
echo.
echo 1. EnableTiledDisplay 1 
echo 2. EnableTiledDisplay 0 (BREAKS DSC)
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :zero
) else if 1 EQU %ERRORLEVEL% (
   call :one
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:one
echo User chose EnableTiledDisplay 1

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableTiledDisplay" /t REG_DWORD /d "1" /f

)
)
) 

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableTiledDisplay" /t REG_DWORD /d "1" /f

goto :end

:zero
echo User chose EnableTiledDisplay 0 (BREAKS DSC)

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
		for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f

)
)
) 

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f

:end

PAUSE
