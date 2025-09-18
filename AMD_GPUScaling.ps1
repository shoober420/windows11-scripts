# AMD Radeon GPU Scaling

Write-Output "!!! REBOOT REQUIRED !!!"

$Monitor_List = @(
    Get-WmiObject WmiMonitorID -Namespace root\wmi | foreach {
        [PSCustomObject]@{
            Instance = $_.InstanceName
            Manufacturer = [System.Text.Encoding]::ASCII.GetString($_.UserFriendlyName).Replace("$([char]0x00)","")
            Serial = [System.Text.Encoding]::ASCII.GetString($_.SerialNumberID).Replace("$([char]0x00)","")
        }
    }
)

$index = 1
foreach ($Monitor in $Monitor_List) {
    '{0}. {1} - S/N: {2}' -f $index++, $Monitor.Manufacturer, $Monitor.Serial
}
Write-Host ''

while ($true) {
    $choice = Read-Host 'Please select a display by number'
    if ([int]$choice -in 1..$Monitor_List.Count) {
        break
    }

    Write-Host 'Invalid selection.'
}

$selectedDisplayPath = $Monitor_List[$choice - 1].Instance
Write-Host "You selected: $selectedDisplayPath"

function Convert-BigEndianToLittleEndian {
    param(
        [int]$BigEndianValue
    )

    $bytes = [System.BitConverter]::GetBytes($BigEndianValue)
    [Array]::Reverse($bytes)
    return [System.BitConverter]::ToUInt32($bytes,0)
}

foreach ($HWID in @(Get-CimInstance win32_VideoController | Where-Object {$_.AdapterDACType -notlike "Internal"} | Select-Object -ExpandProperty PNPDeviceID)) {
    $ClassGUID = Get-ItemPropertyValue -Path "HKLM:SYSTEM\ControlSet001\Enum\$HWID" -Name ClassGUID
    $ClassGUID2 = Get-ItemPropertyValue -Path "HKLM:SYSTEM\ControlSet001\Enum\$HWID" -Name Driver
    $VideoID = Get-ItemPropertyValue -Path "HKLM:SYSTEM\ControlSet001\Enum\$HWID\Device Parameters" -Name VideoID

    $ClassGUID
    $ClassGUID2
    $VideoID

# ClassGUID2 includes 000X in path

}

$SearchPath = "HKLM:\SYSTEM\ControlSet001\Control\Video\$VideoID"

$DisplayPortBinaryActive = ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
$DisplayPortBinaryInactive = ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x00,0x00,0x00,0x00))

$Which = Read-Host 'HDMI = 1 / DisplayPort = 2 \ Enter Value'
switch ($Which) {
1 {foreach ($Path in @(Get-ChildItem $SearchPath -Recurse |% { Get-ItemProperty $_.PSPATH -Name BestViewOption_Hdmi | select PSPath } | Sort-Object -Unique | Convert-Path)) {
    $Path

$DisplayPathNumber = Select-String -InputObject $Path -Pattern "(?<=DisplayPath_).*?(?=\\Option)"

$DisplayPathNumber.Matches.Value

$DisplayPathDigit = $DisplayPathNumber.Matches.Value

$DisplayPathDigit
}
} 

2 {foreach ($Path in @(Get-ChildItem $SearchPath -Recurse |% { Get-ItemProperty $_.PSPATH -Name BestViewOption } | Where-Object { (Compare-Object $_.BestViewOption $DisplayPortBinaryInactive -SyncWindow 0).Count -notlike 0 } )) {
    $Path

$DisplayPathNumber = Select-String -InputObject $Path -Pattern "(?<=DisplayPath_).*?(?=\\Option)"

$DisplayPathNumber.Matches.Value

$DisplayPathDigit = $DisplayPathNumber.Matches.Value

$DisplayPathDigit
}
}
}

foreach ($Monitor in @(Get-WmiObject -Namespace root\wmi -Class WmiMonitorID | Where-Object {$_.InstanceName -like $selectedDisplayPath})) {
    $bigEndianInt32 = [Convert]::ToInt32(-join $Monitor.ManufacturerName[0..2].ForEach({[Convert]::ToString($_ - 64,2).PadLeft(5,'0')}),2)
    $Manufacturer = (Convert-BigEndianToLittleEndian $bigEndianInt32) -shr 16

    $ProductID = [int]::Parse(-join $Monitor.ProductCodeID[0..3].ForEach{[char]$_}, [System.Globalization.NumberStyles]::HexNumber)

    #$Model = ([System.Text.Encoding]::ASCII.GetString($Monitor.UserFriendlyName[0..($Monitor.UserFriendlyNameLength -3)]) -split ' ')[0]

    $Model = ([System.Text.Encoding]::ASCII.GetString($Monitor.UserFriendlyName)).Replace("$([char]0x0000)","")
   
    "EDID_{0}_{1}_{2}_{3}" -f $Manufacturer, $ProductID, $Model, $DisplayPathDigit

    'EDID_{0:x4}_{1:x4}' -f $Manufacturer, $ProductID

    $DisplayPath = "EDID_{0}_{1}_{2}_{3}" -f $Manufacturer, $ProductID, $Model, $DisplayPathDigit

    #"$DisplayPath2 = "EDID_{0}_{1}" -f $Manufacturer, $ProductID

    $DisplayPath2 = 'EDID_{0:x4}_{1:x4}' -f $Manufacturer, $ProductID
    $DisplayPath2

    #$DisplayPath = $Manufacturer.ToString() + '_' + $ProductID.ToString() + '_' + $Model + '_' + $DisplayPathDigit.ToString()
    
}

    $Which = Read-Host 'GPU SCALING OFF = 1 / GPU SCALING ON = 2 \ Enter Value'
switch ($Which) {
  1 {
     # New-Item -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force
     # New-Item -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force

     # Set-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
     # Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force

     # New-Item -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force
     # New-Item -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force

     # Set-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
     # Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
}

  2 {
     # New-Item -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force
     # New-Item -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force

     # Set-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
     # Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force

     # New-Item -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force
     # New-Item -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -ItemType Directory -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force

     # Set-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
     # Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Option" -Name "BestViewOption_Hdmi" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -Force
}
   default {'exiting'}
}

Write-Output "!!! REBOOT REQUIRED !!!"

cmd /k 'pause'