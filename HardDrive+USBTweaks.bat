rem # Hard Drive and USB Tweaks

rem # https://www.youtube.com/watch?v=ajM7Nelf6Uc

rem # Disables power saving features

rem # MSI Mode support for USB Controller
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f

rem # Disable USB PowerSavings
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "D3ColdSupported" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f
)

rem # Disk Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "HIPM" /t REG_DWORD /d "0" /f

rem # USB Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\hubg" /v "DisableOnSoftRemove" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters\Wdf" /v "NoExtraBufferRoom" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbstor" /v "PollingInterval" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "D3ColdSupported" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f

rem # MSI mode support for IDE controller
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

rem # Disable "Allow this device to wake the computer"
powercfg -devicedisablewake "HID-complaint mouse"
powercfg -devicedisablewake "HID-complaint mouse (001)"
powercfg -devicedisablewake "HID Keyboard Device"
powercfg -devicedisablewake "HID Keyboard Device (001)"

rem # Disable disk power savings
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do for /f %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f
)

for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
)

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Storage" /v StorageD3InModernStandby /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v IdlePowerMode /t REG_DWORD /d 0 /f

rem # Disable IoLatencyCap
for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
        REG ADD "%%a" /v IoLatencyCap /t REG_DWORD /d "0" /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
                SET STR=!STR:\Parameters=!
        )
)

rem # Disable StorPort idle
for /F "tokens=*" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
        REG ADD "%%a" /v EnableIdlePowerManagement /t REG_DWORD /d "0" /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\=!
                SET STR=!STR:\Device Parameters\StorPort=!
        )
)

rem # Disable HIPM and DIPM
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0HIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0DIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1HIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1DIPM /t REG_DWORD /d 0 /f

for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
        REG ADD "%%a" /v EnableHIPM /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "%%a" /v EnableDIPM /t REG_DWORD /d 0 /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\=!
        )
)

rem # Disable device stop to save power in certain windows state
reg add "HKLM\SYSTEM\CurrentControlSet\Control\USB\AutomaticSurpriseRemovals" /v AttemptRecoveryFromUsbPowerDrain /t REG_DWORD /d 0 /f

rem # Disable devices power saving
powershell "$devices = Get-WmiObject Win32_PnPEntity; $powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; foreach ($p in $powerMgmt){$IN = $p.InstanceName.ToUpper(); foreach ($h in $devices){$PNPDI = $h.PNPDeviceID; if ($IN -like \"*$PNPDI*\"){$p.enable = $False; $p.psbase.put()}}}"

rem # Disable USB Hub idle
for /F %%a in ('wmic path Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v DeviceSelectiveSuspended /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D1Latency /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D2Latency /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D3Latency /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D1Latency /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D2Latency /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D3Latency /t REG_DWORD /d 0 /f >NUL 2>&1
)

rem # Disable power saving pnp
powershell -noprofile -executionpolicy bypass -c "$power_device_enable = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; $usb_devices = @(\"Win32_USBController\", \"Win32_USBControllerDevice\", \"Win32_USBHub\"); foreach ($power_device in $power_device_enable) { $instance_name = $power_device.InstanceName.ToUpper(); foreach ($device in $usb_devices) { foreach ($hub in Get-WmiObject $device) { $pnp_id = $hub.PNPDeviceID; if ($instance_name -like \"*$pnp_id*\") { $power_device.enable = $False; $power_device.psbase.put(); }}}}"

rem # Disable Power saving from USB
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters\Wdf" /v NoExtraBufferRoom /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v AllowIdleIrpInD3 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f
for /L %%V in (0,1,32) do (
    if %%V LSS 10 ( 
                REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\000%%V" /v IdleEnable /t REG_DWORD /d 0 /f
        ) else ( 
                REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\00%%V" /v IdleEnable /t REG_DWORD /d 0 /f
        )
)

rem # Disk Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "MaxTimeSeparationBeforeCorrect" /t REG_DWORD /d "1" /f

rem # NVMe Tweaks

rem # Disable NVME Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Classpnp" /v "NVMeDisablePerfThrottling" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "StorNVMeAllowZeroLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ForceFlush" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ImmediateData" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ForceEagerWrites" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "StorNVMeAllowZeroLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ForceFlush" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ImmediateData" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ForceEagerWrites" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "QueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NvmeMaxReadSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NvmeMaxWriteSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxSegmentsPerCommand" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxOutstandingCmds" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxQueuedCommands" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxOutstandingIORequests" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NumberOfRequests" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "IoSubmissionQueueCount" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "IoQueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "HostMemoryBufferBytes" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ArbitrationBurst" /t REG_DWORD /d "256" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "QueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NvmeMaxReadSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NvmeMaxWriteSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Devicr" /v "MaxSegmentsPerCommand" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxOutstandingCmds" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxQueuedCommands" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxOutstandingIORequests" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NumberOfRequests" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "IoSubmissionQueueCount" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "IoQueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "HostMemoryBufferBytes" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ArbitrationBurst" /t REG_DWORD /d "256" /f



rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking

rem # Copy Buffer Size
rem # 0x40000/256Kb - 0x2000/8Kb - 0x100000/1Mb
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "CopyBufferSize" /t REG_DWORD /d "0x100000" /f

rem # 32KB blocks
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileChunkSize" /t REG_DWORD /d "0x8000" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileOverlappedCount" /t REG_DWORD /d "0x20" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileBufferedSynchronousIo" /t REG_DWORD /d "0x40" /f

PAUSE
