rem # Enable HDR

rem # !!! WARNING !!!

rem # RECOMMENDED TO DISABLE ONBOARD INTEGRATED GPU IN BIOS IF POSSIBLE

rem # Double check to make sure the correct dedicated GPU hardware ID was selected or performance will suffer

rem # !!! WARNING !!!

rem # wmic path win32_videocontroller get PNPDeviceID,Name

PAUSE

rem # HighPerfAdapter must match Hardware ID in Device Manager for dedicated GPU

rem # Device Manager > Display Adapters > "GPUNAME" > Properties > Details > Property > Hardware Ids

rem # HighPerfAdapter="VEN&DEV&SUBSYS" / PCI\VEN_10DE&DEV_2684&SUBSYS_89321043 / HighPerfAdapter=10DE&2684&89321043

rem # reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=10DE&2684&89321043"

rem # SwapEffectUpgradeEnable = "Optimizations" for windowed and borderless windowed games
rem # Only enable when playing in windowed mode

PAUSE

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/find-gpu-ven-dev-subsys-values-for-highperfadapter-option-using-wmic-or-other-method.30127/post-521164
rem # https://www.elevenforum.com/t/pnputil-uninstall-integrated-gpu.33072/

for /f "tokens=1-6 delims=_&" %%a in ('wmic path win32_videocontroller where "not AdapterDACType like 'Internal'" get PNPDeviceID ^| find "PCI"') do (
    reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=%%b&%%d&%%f;AutoHDREnable=1;VRROptimizeEnable=0;SwapEffectUpgradeEnable=0"
)

wmic path win32_videocontroller get PNPDeviceID,Name

PAUSE