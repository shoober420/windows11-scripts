rem # Enable DirectXUserGlobalSettings

rem # SwapEffectUpgradeEnable = Optimizations for windowed and borderless windowed games

reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;AutoHDREnable=1;SwapEffectUpgradeEnable=1" /f 

PAUSE
