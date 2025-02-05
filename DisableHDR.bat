rem # Disable HDR
rem # Decreases FPS when enabled

reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "AutoHDREnable=0"

PAUSE