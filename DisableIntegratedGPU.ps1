# Disable Integrated GPU

foreach ($dev in (Get-PnpDevice -Class Display | Where-Object {$_.Name -like "*Intel*"})) {
    &"pnputil" /remove-device $dev.InstanceId;
}

cmd /k 'pause'

