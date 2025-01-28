rem # Enable HighPerfAdapter

rem # !!! WARNING !!!

rem # IF PERFORMANCE DECREASES, run EnableDirectXUserGlobalSettings.bat

rem # MUST DISABLE ONBOARD INTEGRATED GPU IN BIOS AND DEVICE MANAGER TO RUN PROPERLY

rem # You will need to manually set values below if onboard integrated GPU is enabled

rem # !!! WARNING !!!

PAUSE

rem # SwapEffectUpgradeEnable = Optimizations for windowed and borderless windowed games
rem # HighPerfAdapter must match Hardware ID in Device Manager for GPU
rem # Device Manager > Display Adapters > "GPUNAME" > Properties > Details > Property > Hardware Ids
rem # HighPerfAdapter="VEN&DEV&SUBSYS" / PCI\VEN_10DE&DEV_2684&SUBSYS_89321043 / HighPerfAdapter=10DE&2684&89321043

rem reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=10DE&2684&89321043;VRROptimizeEnable=0;AutoHDREnable=1;SwapEffectUpgradeEnable=1" /f

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/find-gpu-ven-dev-subsys-values-for-highperfadapter-option-using-wmic-or-other-method.30127/post-521164

for /f "tokens=1-6 delims=_&" %%a in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr PCI') do (
    reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=%%b&%%d&%%f;VRROptimizeEnable=0;AutoHDREnable=1;SwapEffectUpgradeEnable=1" /f 
)

PAUSE