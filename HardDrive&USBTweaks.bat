rem # Hard Drive and USB Tweaks
rem # Disables power saving features

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
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do for /f %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f >nul 2>&1
for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
) >nul 2>&1
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

PAUSE