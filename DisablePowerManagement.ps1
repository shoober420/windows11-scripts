# Disable Power Management for all devices
# Disable "Allow the computer to turn off this device to save power"
# Disable "Allow this device to wake the computer"

# https://www.elevenforum.com/members/pseymour.23912/
# https://www.elevenforum.com/t/disable-waking-up-from-hibernation-for-good.27700/#post-487462

Set-CimInstance -Query 'SELECT InstanceName FROM MSPower_DeviceWakeEnable WHERE (Enable = True)' -Namespace 'root\WMI' -Property @{Enable = $false}

Set-CimInstance -Query 'SELECT InstanceName FROM MSPower_DeviceEnable WHERE (Enable = True)' -Namespace 'root\WMI' -Property @{Enable = $false}

cmd /c 'pause'