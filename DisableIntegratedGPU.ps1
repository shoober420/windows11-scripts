# Disable Integrated GPU

# foreach ($dev in (Get-PnpDevice -Class Display | Where-Object {$_.Name -like "*Intel*"})) {
rem #    &"pnputil" /disable-device $dev.InstanceId;
rem # }

# foreach ($dev in (Get-CimInstance win32_VideoController | Where-Object {$_.AdapterDACType -like "Internal"})) {
rem #    &"pnputil" /disable-device $dev.PNPDeviceID;
rem # }

# https://www.elevenforum.com/members/garlin.5387/
# https://www.elevenforum.com/t/pnputil-uninstall-integrated-gpu.33072/#post-559670

$Adapters = @(Get-CimInstance win32_VideoController | Where-Object {$_.AdapterDACType -notlike "Internal"})

if ($Adapters.Count -ge 1) {
    foreach ($dev in (Get-CimInstance win32_VideoController | Where-Object {$_.AdapterDACType -like "Internal"})) {
        &"pnputil" /disable-device $dev.PNPDeviceID
    }
}

cmd /k 'pause'

