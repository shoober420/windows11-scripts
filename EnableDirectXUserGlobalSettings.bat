rem # Enable DirectXUserGlobalSettings

rem # SwapEffectUpgradeEnable = "Optimizations" for windowed and borderless windowed games
rem # Only enable when playing in windowed mode

reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;SwapEffectUpgradeEnable=0" /f

PAUSE
