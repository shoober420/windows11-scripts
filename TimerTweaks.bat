rem # Timer Tweaks

rem # https://sites.google.com/view/melodystweaks/misconceptions-about-timers-hpet-tsc-pmt

rem # https://www.xbitlabs.com/hpet-settings/

rem # Leave HPET enabled in BIOS

rem # Timer Resolution Tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f

rem # Disable HPET in Windows
rem # useplatformclock not found by default, setting not present unless enabled prior
bcdedit /deletevalue useplatformclock

rem # Disable RTC (Real Time Clock)
rem # Lowers FPS when enabled
bcdedit /deletevalue useplatformtick

rem # Disable Power Saving Feature
bcdedit /set disabledynamictick yes

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableDynamicTick" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DISABLE_DYNAMIC_TICK" /t REG_SZ /d "1" /f

rem # TSC Sync Policy
bcdedit /set tscsyncpolicy enhanced

PAUSE