rem # Advanced Installation script

rem # Credits:

rem # https://www.elevenforum.com/members/garlin.5387
rem # https://www.elevenforum.com/members/csmc.38355
rem # jdallmann
rem # Kizzimo
rem # foss-lover34
rem # brusk9060
rem # dersk111y
rem # V3nilla
rem # ja2forever
rem # https://www.mdgx.com
rem # https://github.com/Batleman
rem # https://github.com/AlchemyTweaks
rem # https://github.com/TairikuOokami
rem # https://github.com/ionuttbara
rem # https://github.com/Hyyote
rem # https://github.com/MoriEdan
rem # https://github.com/NicholasBly
rem # https://github.com/rahilpathan
rem # https://github.com/ChrisTitusTech
rem # https://github.com/raspi
rem # https://github.com/simeononsecurity
rem # https://github.com/alufena
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://admx.help
rem # https://github.com/ancel1x/Ancels-Performance-Batch
rem # https://github.com/Batlez/Batlez-Tweaks
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker
rem # https://github.com/HakanFly/Windows-Tweaks
rem # http://bbs.c3.wuyou.net/forum.php?mod=viewthread&tid=437913
rem # https://github.com/CrackedStuffEZ



cd "%~dp0"

call EnablePowerShell.bat
cd "%~dp0"

call EnableTLS1.2.bat
cd "%~dp0"

call VCRedist.bat
cd "%~dp0"

call WingetUpdateApps.bat
cd "%~dp0"

call CPUTweaks.bat
cd "%~dp0"

call GPUTweaks.bat
cd "%~dp0"

call KernelTweaks.bat
cd "%~dp0"

call TimerTweaks.bat
cd "%~dp0"

call HardDrive_Tweaks.bat
cd "%~dp0"

call USBTweaks.bat
cd "%~dp0"

call InputTweaks.bat
cd "%~dp0"

call InternetSettings.bat
cd "%~dp0"

call MouseAccelFix.bat
cd "%~dp0"

call NICProperties.bat
cd "%~dp0"

call PowerPlanUltra.bat
cd "%~dp0"

call DisableScheduledTasks.bat
cd "%~dp0"

call DisableSysMain.bat
cd "%~dp0"

call DisableEdge.bat
cd "%~dp0"

call DisableMIDI2.0.bat
cd "%~dp0"

call RAMTweaks.bat
cd "%~dp0"

call ThreadQuantum.bat
cd "%~dp0"

call UseLargePages.bat
cd "%~dp0"

call EnableClearPageFileAtShutdown.bat
cd "%~dp0"

call DisablePageFile.bat
cd "%~dp0"

call RemoveRemoteDesktopConnection.bat
cd "%~dp0"

call RemoveWindowsApps.bat
cd "%~dp0"

call RemoveWindowsFeatures.bat
cd "%~dp0"

call EnableSerializeTimerExpiration.bat
cd "%~dp0"

regedit.exe "%~dp0\MaxPendingInterrupts.reg"
cd "%~dp0"

regedit.exe "%~dp0\ResourceSets.reg"
cd "%~dp0"

regedit.exe "%~dp0\Base+OverTargetPriorities.reg"
cd "%~dp0"

call BCDEDIT_Tweaks.bat
cd "%~dp0"

rem call SetTimerResolution.bat
cd "%~dp0"

call DWM_ExclusiveModeFramerateAveragingPeriodMs.bat

cd "%~dp0"

call DWM_Tweaks.bat

cd "%~dp0"

call DisableComponents.bat
cd "%~dp0"

call DisableStartMenu.bat
cd "%~dp0"

call DisableShellExperienceHost.bat
cd "%~dp0"

call MTU.bat
cd "%~dp0"

call DeviceManager.bat
cd "%~dp0"

call NetworkTweaks.bat

cd "%~dp0"

call Windows11Tweaks.bat

cd "%~dp0"

call DisableSSL+LegacyTLS.bat
cd "%~dp0"

call RefreshRate.bat
cd "%~dp0"

call EnableSystemProfile.bat
cd "%~dp0"

call GPU_Scheduling.bat
cd "%~dp0"

call CPU_Mitigations.bat
cd "%~dp0"



@echo off



echo.
echo 1. Enable Prefetcher (RECOMMENDED)
echo 2. Disable Prefetcher
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scccipsterrzzz
) else if 2 EQU %ERRORLEVEL% (
   call :pd
) else if 1 EQU %ERRORLEVEL% (
   call :pe
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:pe
echo User chose Enable Prefetcher (RECOMMENDED)

call EnablePrefetcher.bat

goto :end

:pd
echo User chose Disable Prefetcher

call DisablePrefetcher.bat

goto :end

:scccipsterrzzz
echo User chose SKIP

goto :end

:end



echo.
echo 1. Enable SuperFetch
echo 2. Disable SuperFetch
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scccipsteerrzzzzz
) else if 2 EQU %ERRORLEVEL% (
   call :sd
) else if 1 EQU %ERRORLEVEL% (
   call :se
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:se
echo User chose Enable SuperFetch

call EnableSysMain.bat

goto :end

:sd
echo User chose Disable SuperFetch

call DisableSysMain.bat

goto :end

:scccipsteerrzzzzz
echo User chose SKIP

goto :end

:end



echo.
echo 1. Above Normal Priority (RECOMMENDED)
echo 2. High Priority
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :scccipsterzzz
) else if 2 EQU %ERRORLEVEL% (
   call :highp
) else if 1 EQU %ERRORLEVEL% (
   call :aboven
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:aboven
echo User chose Above Normal Priority (RECOMMENDED)

call AboveNormalPriority.bat

goto :end

:highp
echo User chose High Priority

call HighPriority.bat

goto :end

:scccipsterzzz
echo User chose SKIP

goto :end

:end



echo.
echo 1. Disable Security Settings (BREAKS CERTAIN ANTICHEATS)
echo 2. Disable Security Settings (ANTICHEAT SUPPORT)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipsterzz
) else if 2 EQU %ERRORLEVEL% (
   call :secac
) else if 1 EQU %ERRORLEVEL% (
   call :secoff
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:secoff
echo User chose Disable Security Settings (BREAKS CERTAIN ANTICHEATS)

call SecuritySettings.bat

goto :end

:secac
echo User chose Disable Security Settings (ANTICHEAT SUPPORT)

call SecuritySettings_AntiCheat.bat

goto :end

:skipsterzz
echo User chose SKIP

goto :end

:end



echo.
echo 1. BLUETOOTH ENABLED
echo 2. BLUETOOTH DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :BTOFF
) else if 1 EQU %ERRORLEVEL% (
   call :BTON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:BTON
echo User chose BLUETOOTH ENABLED

call EnableBluetooth.bat

goto :end

:BTOFF
echo User chose BLUETOOTH DISABLED

call DisableBluetooth.bat

goto :end

:end



echo.
echo 1. TPM + BitLocker ENABLED
echo 2. TPM + BitLocker DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :TPMOFF
) else if 1 EQU %ERRORLEVEL% (
   call :TPMON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:TPMON
echo User chose TPM ENABLED

goto :end

:TPMOFF
echo User chose TPM DISABLED

call DisableTPM+SecureBoot.bat
call DisableBitLocker.bat
call Decrypt+OSCompression.bat

goto :end

:end



echo.
echo 1. Static IP Connection
echo 2. DHCP Connection
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :DHCPON
) else if 1 EQU %ERRORLEVEL% (
   call :STATICON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:DHCPON
echo User chose DHCP Connection

goto :end

:STATICON
echo User chose Static IP Connection

call DisableDHCP.bat
call StaticIPConnection.bat
call DisableWinHTTP.bat
call DisableWLAN_AutoConfig.bat

goto :end

:end



echo.
echo 1. NVIDIA GPU
echo 2. AMD GPU
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :AMD
) else if 1 EQU %ERRORLEVEL% (
   call :NV
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:AMD
echo User chose AMD GPU

call AMDGPUTweaks.bat

goto :end

:NV
echo User chose NVIDIA GPU

call NVGPUTweaks.bat

goto :end

:end



echo.
echo 1. Enable System Profile Tweaks
echo 2. Disable System Profile Tweaks
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipsterzzss
) else if 2 EQU %ERRORLEVEL% (
   call :sysprooff
) else if 1 EQU %ERRORLEVEL% (
   call :sysproon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:sysproon
echo User chose Enable System Profile Tweaks

call EnableSystemProfile.bat

goto :end

:sysprooff
echo User chose Disable System Profile Tweaks

call DisableSystemProfile.bat

goto :end

:skipsterzzss
echo User chose SKIP

goto :end

:end



echo.
echo Fullscreen Optimizations (FSO)
echo.
echo 1. Enable FSO
echo 2. Disable FSO (HDR OFF)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :sccipp
) else if 2 EQU %ERRORLEVEL% (
   call :fsooff
) else if 1 EQU %ERRORLEVEL% (
   call :fsoon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:fsoon
echo User chose Enable FSO

call EnableFullscreenOptimizations.bat
cd "%~dp0"

goto :end

:fsooff
echo User chose Disable FSO (HDR OFF)

call DisableFullscreenOptimizations.bat
cd "%~dp0"

goto :end

:sccipp
echo User chose SKIP

goto :end

:end



echo.
echo 1. Enable Thread DPC
echo 2. Disable Thread DPC
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :threadoff
) else if 1 EQU %ERRORLEVEL% (
   call :threadon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:threadon
echo User chose Enable Thread DPC

call EnableThreadDPC.bat

goto :end

:threadoff
echo User chose Disable Thread DPC

call DisableThreadDPC.bat

goto :end

:end



echo.
echo 1. ENABLE KERNEL DPC TWEAKS
echo 2. DISABLE KERNEL DPC TWEAKS
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :kdpcoff
) else if 1 EQU %ERRORLEVEL% (
   call :kdpcon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:kdpcon
echo User chose ENABLE KERNEL DPC TWEAKS

call EnableKernelDPCTweaks.bat

goto :end

:kdpcoff
echo User chose DISABLE KERNEL DPC TWEAKS

call DisableKernelDPCTweaks.bat

goto :end

:end



echo.
echo 1. TouchPad ENABLED
echo 2. TouchPad DISABLED
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :TPOFF
) else if 1 EQU %ERRORLEVEL% (
   call :TPON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:TPOFF
echo User chose TouchPad DISABLED

call DisableTouchPad.bat

goto :end

:TPON
echo User chose TouchPad ENABLED

call EnableTouchPad.bat

goto :end

:end

cd "%~dp0"



ECHO R | powershell.exe ./DisableNetBIOS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DNS.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisableScheduledTasks.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisableIntegratedGPU.ps1
cd "%~dp0"

ECHO R | powershell.exe ./DisablePowerManagement.ps1

ECHO R | powershell.exe ./DisableSoundEnhancements.ps1
cd "%~dp0"



echo.
echo 1. Enable Microsoft Store
echo 2. Disable Microsoft Store (BREAKS MINECRAFT)
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :dstore
) else if 1 EQU %ERRORLEVEL% (
   call :estore
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:estore
echo User chose Enable Microsoft Store

call EnableStore.bat

goto :end

:dstore
echo User chose Disable Microsoft Store (BREAKS MINECRAFT)

call DisableStore.bat

goto :end

:end



echo.
echo 1. Install Microsoft Store
echo 2. Remove Microsoft Store (BREAKS MINECRAFT)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skippert
) else if 2 EQU %ERRORLEVEL% (
   call :ustore
) else if 1 EQU %ERRORLEVEL% (
   call :istore
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:istore
echo User chose Install Microsoft Store

call InstallStore.bat

goto :end

:ustore
echo User chose Remove Microsoft Store

call RemoveStore.bat

goto :end

:skippert
echo User chose SKIP

goto :end

:end



echo.
echo 1. Internet Services ENABLED
echo 2. Internet Services DISABLED (BREAKS VPN)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipplez
) else if 2 EQU %ERRORLEVEL% (
   call :innernetoff
) else if 1 EQU %ERRORLEVEL% (
   call :innerneton
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:innerneton
echo User chose Internet Services ENABLED

call EnableServicesInternet.bat

goto :end

:innernetoff
echo User chose Internet Services DISABLED (BREAKS VPN)

call DisableServicesInternet.bat

goto :end

:skipplez
echo User chose SKIP

goto :end

:end

cd "%~dp0"



echo.
echo 1. Windows Services ENABLED
echo 2. Windows Services DISABLED (MAY BREAK SOME APPS)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipples
) else if 2 EQU %ERRORLEVEL% (
   call :SVCOFF
) else if 1 EQU %ERRORLEVEL% (
   call :SVCON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:SVCON
echo User chose Windows Services ENABLED

call EnableServicesWindows.bat

goto :end

:SVCOFF
echo User chose Windows Services DISABLED (MAY BREAK SOME APPS)

call DisableServicesWindows.bat

goto :end

:skipples
echo User chose SKIP

goto :end

:end

cd "%~dp0"



echo.
echo 1. Keep Firewall Rules
echo 2. Remove Firewall Rules
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :FWOFF
) else if 1 EQU %ERRORLEVEL% (
   call :FWON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:FWON
echo User chose Keep Firewall Rules

goto :end

:FWOFF
echo User chose Remove Firewall Rules

call RemoveFirewallRules.bat

goto :end

:end

cd "%~dp0"



echo.
echo 1. Keep StartUp Apps
echo 2. Remove StartUp Apps
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipplerzzzzz
) else if 2 EQU %ERRORLEVEL% (
   call :restartups
) else if 1 EQU %ERRORLEVEL% (
   call :keepstart
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:keepstart
echo User chose Keep StartUp Apps

goto :end

:restartups
echo User chose Remove StartUp Apps

call RemoveStartUpApps.bat

goto :end

:skipplerzzzzz
echo User chose Keep StartUp Apps

goto :end

:end



echo.
echo 1. Enable Windows 95 Theme
echo 2. Keep Current Theme
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :KEEPTHEME
) else if 1 EQU %ERRORLEVEL% (
   call :WIN95ON
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:KEEPTHEME
echo User chose Keep Current Theme

goto :end

:WIN95ON
echo User chose Enable Windows 95 Theme

call Theme.bat

goto :end

:end

cd "%~dp0"



echo.
echo 1. Enable Solid Color Background
echo 2. Keep Current Wallpaper
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :WALLPAPER
) else if 1 EQU %ERRORLEVEL% (
   call :SOLID
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:WALLPAPER
echo User chose Keep Current Wallpaper

goto :end

:SOLID
echo User chose Solid Color Background

call WallpaperSolidColor.bat

goto :end

:end

cd "%~dp0"



echo.
echo 1. Enable Windows 95 Vaporwave Accent Colors
echo 2. Keep Current Accent Color
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :KEEPACCENT
) else if 1 EQU %ERRORLEVEL% (
   call :VAPORWAVE
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:KEEPACCENT
echo User chose Keep Current Accent Color

goto :end

:VAPORWAVE
echo User chose Enable Windows 95 Vaporwave Accent Colors

call AccentColor.bat

goto :end

:end

cd "%~dp0"



echo.
echo 1. Force 96 Monitor DPI (Better mouse movement) (MAY CAUSE BLURRY TEXT IN CERTAIN APPS)
echo 2. Keep Current Monitor DPI
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :DEFDPI
) else if 1 EQU %ERRORLEVEL% (
   call :96DPI
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:DEFDPI
echo User chose Keep Current Monitor DPI

goto :end

:96DPI
echo User chose Force 96 Monitor DPI

call DisablePerProcessSystemDPI.bat

goto :end

:end



echo.
echo 1. Enable AMDGPU: DalDramClockChangeLatencyNs tweak (MAY CAUSE BLACK SCREEN AND FLICKERING)
echo 2. Disable AMDGPU: DalDramClockChangeLatencyNs tweak
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :skipsters
) else if 2 EQU %ERRORLEVEL% (
   call :damddaldram
) else if 1 EQU %ERRORLEVEL% (
   call :amddaldram
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:amddaldram
echo User chose Enable AMDGPU: DalDramClockChangeLatencyNs tweak (MAY CAUSE BLACK SCREEN AND FLICKERING)

call EnableAMDGPU_DalDramClockChangeLatencyNs.bat

goto :end

:damddaldram
echo User chose Disable AMDGPU: DalDramClockChangeLatencyNs tweak

call DisableAMDGPU_DalDramClockChangeLatencyNs.bat

goto :end

:skipsters
echo User chose SKIP

goto :end

:end



echo.
echo 1. Vim
echo 2. Notepad++
echo 3. Classic Notepad
echo 4. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :skippy
) else if 3 EQU %ERRORLEVEL% (
   call :cnote
) else if 2 EQU %ERRORLEVEL% (
   call :note
) else if 1 EQU %ERRORLEVEL% (
   call :vim
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:vim
echo User chose Vim

call InstallVim.bat
cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsVim.ps1
cd "%~dp0"

goto :end

:note
echo User chose Notepad++

call InstallNotepad++.bat
cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsNotepad++.ps1
cd "%~dp0"

goto :end

:cnote
echo User chose Classic Notepad

cd "%~dp0"

ECHO R | powershell.exe ./TextFileAssociationsClassicNotepad.ps1
cd "%~dp0"

goto :end

:skippy
echo User chose SKIP

goto :end

:end



echo.
echo 1. Uninstall Windows Terminal
echo 2. SKIP
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :skipster
) else if 1 EQU %ERRORLEVEL% (
   call :delterm
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:delterm
echo User chose Uninstall Windows Terminal

call RemoveWindowsTerminal.bat

goto :end

:skipster
echo User chose SKIP

goto :end

:end



rem # SETUP CUSTOM RESOLUTION UTILITY

rem # Launch GPU option scripts to finish installation (NVProfileInspector required for NVIDIA)

rem # NVIDIAPerformanceProfile.nip / NVIDIAHighQualityProfileOGL.nip / NVIDIAHighQualityProfileD3D.nip

rem # AMDAdrenalinSettingsPERF.bat / AMDAdrenalinSettingsHQ.bat

PAUSE