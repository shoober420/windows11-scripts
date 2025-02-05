rem # Disable HDR

rem # !!! WARNING !!!

rem # MUST DISABLE ONBOARD INTEGRATED GPU IN BIOS AND DEVICE MANAGER TO RUN PROPERLY

rem # You will need to manually set values below if onboard integrated GPU is enabled

rem # Double check to make sure the correct dedicated GPU hardware ID was selected or performance will suffer

rem # !!! WARNING !!!

PAUSE

rem # HighPerfAdapter must match Hardware ID in Device Manager for dedicated GPU

rem # Device Manager > Display Adapters > "GPUNAME" > Properties > Details > Property > Hardware Ids

rem # HighPerfAdapter="VEN&DEV&SUBSYS" / PCI\VEN_10DE&DEV_2684&SUBSYS_89321043 / HighPerfAdapter=10DE&2684&89321043

rem reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=10DE&2684&89321043"

rem # SwapEffectUpgradeEnable = "Optimizations" for windowed and borderless windowed games
rem # Only enable when playing in windowed mode

PAUSE

rem # Launch DisableIntegratedGPU.ps1

cd "%~dp0"
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%USERPROFILE%\Downloads"

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/find-gpu-ven-dev-subsys-values-for-highperfadapter-option-using-wmic-or-other-method.30127/post-521164

for /f "tokens=1-6 delims=_&" %%a in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr PCI') do (
    reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerfAdapter=%%b&%%d&%%f;AutoHDREnable=0;VRROptimizeEnable=0;SwapEffectUpgradeEnable=0"
)

PAUSE
