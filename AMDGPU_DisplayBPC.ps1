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

foreach ($Path in @(Get-ChildItem $SearchPath -Recurse |% { Get-ItemProperty $_.PSPATH -Name *BestViewOption_Hdmi* | select PSPath } | Sort-Object -Unique | Convert-Path)) {
    $Path

$DisplayPathNumber = Select-String -InputObject $Path -Pattern "(?<=DisplayPath_).*?(?=\\Option)"

$DisplayPathNumber.Matches.Value

$DisplayPathDigit = $DisplayPathNumber.Matches.Value

$DisplayPathDigit

}

foreach ($Monitor in @(Get-WmiObject -Namespace root\wmi -Class WmiMonitorID)) {
    $bigEndianInt32 = [Convert]::ToInt32(-join $Monitor.ManufacturerName[0..2].ForEach({[Convert]::ToString($_ - 64,2).PadLeft(5,'0')}),2)
    $Manufacturer = (Convert-BigEndianToLittleEndian $bigEndianInt32) -shr 16

    $ProductID = [int]::Parse(-join $Monitor.ProductCodeID[0..3].ForEach{[char]$_}, [System.Globalization.NumberStyles]::HexNumber)

    $Model = ([System.Text.Encoding]::ASCII.GetString($Monitor.UserFriendlyName[0..($Monitor.UserFriendlyNameLength -3)]) -split ' ')[0]
   
    "EDID_{0}_{1}_{2}_{3}" -f $Manufacturer, $ProductID, $Model, $DisplayPathDigit

    $DisplayPath = "EDID_{0}_{1}_{2}_{3}" -f $Manufacturer, $ProductID, $Model, $DisplayPathDigit
    
}

    $Which = Read-Host '8bpc = 1 / 10bpc = 2 / 12bpc = 3 \ Enter Value'
switch ($Which) {
  1 {New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x02,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x02,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x02,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x02,0x00,0x00,0x00)) -PropertyType Binary -Force}


  2 {New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x03,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x03,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x03,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x03,0x00,0x00,0x00)) -PropertyType Binary -Force}


  3 {New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x04,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Class\$ClassGUID2\DAL3_DATA\common\EDID_$DisplayPath\" -Name color_depth -Value ([byte[]]@(0x04,0x00,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\ControlSet001\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x02,0x04,0x00,0x00)) -PropertyType Binary -Force
     New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Video\$VideoID\0000\DAL3_DATA\common\EDID_$DisplayPath\" -Name "color_depth" -Value ([byte[]]@(0x04,0x00,0x00,0x00)) -PropertyType Binary -Force}
  default {'exiting'}
}

cmd /k 'pause'
