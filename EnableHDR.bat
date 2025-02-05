rem # Enable HDR
rem # Decreases FPS when enabled

PAUSE

$RegistryPath = "HKCU:\Software\Microsoft\DirectX\UserGpuPreferences"
$Name = "DirectXUserGlobalSettings"
$Value = "AutoHDREnable=1"

if (!(Test-Path -Path $RegistryPath -Name $Name)) {
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType String -Force
}

cmd /c 'pause'