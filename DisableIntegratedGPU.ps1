# Disable Integrated GPU

rem # foreach ($dev in (Get-PnpDevice -Class Display | Where-Object {$_.Name -like "*Intel*"})) {
rem #    &"pnputil" /disable-device $dev.InstanceId;
rem # }

foreach ($dev in (Get-CimInstance win32_VideoController | Where-Object {$_.AdapterDACType -like "Internal"})) {
    &"pnputil" /disable-device $dev.PNPDeviceID;
}

cmd /k 'pause'

