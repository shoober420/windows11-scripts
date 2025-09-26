rem # USB Tweaks

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

rem # USB Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\hubg" /v "DisableOnSoftRemove" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters\Wdf" /v "NoExtraBufferRoom" /t REG_DWORD /d "0" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbstor" /v "PollingInterval" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "D3ColdSupported" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f

rem # Disable "Allow this device to wake the computer"
powercfg -devicedisablewake "HID-complaint mouse"
powercfg -devicedisablewake "HID-complaint mouse (001)"
powercfg -devicedisablewake "HID Keyboard Device"
powercfg -devicedisablewake "HID Keyboard Device (001)"

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
rem REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters\Wdf" /v NoExtraBufferRoom /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v AllowIdleIrpInD3 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f
for /L %%V in (0,1,32) do (
    if %%V LSS 10 ( 
                REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\000%%V" /v IdleEnable /t REG_DWORD /d 0 /f
        ) else ( 
                REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\00%%V" /v IdleEnable /t REG_DWORD /d 0 /f
        )
)



reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB\Hub" /v "DisablePowerDown" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "DisableLegacyUSBSupport" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "ForceFullSpeed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "IdleEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "LowLatencyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Services\USBXHCI\Parameters\Device" /v "InterruptThreshold" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\Parameters" /v "DisableOnSoftRemove" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\Parameters" /v "EnableAggressiveSuspend" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\Parameters" /v "SelectiveSuspendTimeout" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "DisableHCS0Idle" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags" /v "IgnoreHWSerNum" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v "LogControlEnable" /t REG_QWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb" /v "IdleEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisablePowerDown" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "EnIdleEndpointSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\USBHUB3\Parameters\Device" /v "InterruptThreshold" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB\Parameters" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB\Parameters" /v "DisableSelectiveSuspendTimeout" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB\Parameters" /v "DisableZeroLengthControlTransfers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB\Parameters" /v "ForceFullSpeed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB\Parameters" /v "ForceHCResetOnResume" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ForceFullSpeed" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "LowLatencyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbaudio\Parameters" /v "AudioAlwaysOn" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbaudio\Parameters" /v "IsochronousTransferMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbaudio\Parameters" /v "Latency" /t REG_DWORD /d "1" /f



rem # USB I/O Queue Work Item Tweaks
rem # alufena = 0x0000000a
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xusb22\Parameters" /v "IoQueueWorkItem" /t REG_DWORD /d "0x0000000a" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "IoQueueWorkItem" /t REG_DWORD /d "0x0000000a" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\Parameters" /v "IoQueueWorkItem" /t REG_DWORD /d "0x0000000a" /f

PAUSE