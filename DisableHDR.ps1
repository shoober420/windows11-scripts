rem # Disable HDR
rem # Decreases FPS when enabled

PAUSE

foreach ($dev in (Get-PnpDevice -Class Display | Where-Object {$_.Name -like "*Intel*"})) {
    &"pnputil" /remove-device $dev.InstanceId;
}

$RegistryPath = "HKCU:\Software\Microsoft\DirectX\UserGpuPreferences"
$Name = "DirectXUserGlobalSettings"
$Value = "AutoHDREnable=0"

if (!(Test-Path -Path $RegistryPath -Name $Name)) {
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force
}

cmd /c 'pause'
