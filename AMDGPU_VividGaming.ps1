# AMD Radeon Display Color Enhancement 
# Vivid Gaming

# https://www.elevenforum.com/members/garlin.5387/
# https://www.elevenforum.com/t/query-monitor-edid.33440/

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

}

$SearchPath = "HKLM:\SYSTEM\ControlSet001\Control\Video\$VideoID"

$DisplayPortBinaryActive = ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
$DisplayPortBinaryInactive = ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x00,0x00,0x00,0x00))

$Which = Read-Host 'HDMI = 1 / DisplayPort = 2 \ Enter Value'
switch ($Which) {
1 {foreach ($Path in @(Get-ChildItem $SearchPath -Recurse |% { Get-ItemProperty $_.PSPATH -Name *BestViewOption_Hdmi* | select PSPath } | Sort-Object -Unique | Convert-Path)) {
    $Path

$DisplayPathNumber = Select-String -InputObject $Path -Pattern "(?<=DisplayPath_).*?(?=\\Option)"

$DisplayPathNumber.Matches.Value

$DisplayPathDigit = $DisplayPathNumber.Matches.Value

$DisplayPathDigit
}
} 

2 {foreach ($Path in @(Get-ChildItem $SearchPath -Recurse |% { Get-ItemProperty $_.PSPATH -Name *BestViewOption* | select PSPath } | Where-Object { $_.BestViewOption -match $DisplayPortBinaryActive } | Convert-Path)) {
    $Path

$DisplayPathNumber = Select-String -InputObject $Path -Pattern "(?<=DisplayPath_).*?(?=\\Option)"

$DisplayPathNumber.Matches.Value

$DisplayPathDigit = $DisplayPathNumber.Matches.Value

$DisplayPathDigit
}
}
}

foreach ($Monitor in @(Get-WmiObject -Namespace root\wmi -Class WmiMonitorID)) {
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

    $Which = Read-Host 'Vivid Gaming = 1 / Disabled = 2 \ Enter Value'
switch ($Which) {
  1 {New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force}


  2 {New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force

     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Settings" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL2_DATA__2_0\DisplayPath_$DisplayPathDigit\$DisplayPath2\Adjustment" -Name "DAL_SCE_Strength" -Value ([byte[]]@(0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x05,0x00,0x00,0x00)) -PropertyType Binary -Force}
   default {'exiting'}
}

cmd /k 'pause'