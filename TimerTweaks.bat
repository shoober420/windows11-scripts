rem # Timer Tweaks

rem # https://sites.google.com/view/melodystweaks/misconceptions-about-timers-hpet-tsc-pmt

rem # https://www.xbitlabs.com/hpet-settings/

rem # Leave HPET enabled in BIOS

rem # Disable HPET in Windows
rem # useplatformclock not found by default, setting not present unless enabled prior
bcdedit /deletevalue useplatformclock

rem # Disable RTC (Real Time Clock)
rem # Lowers FPS when enabled
bcdedit /deletevalue useplatformtick

rem # Disable Power Saving Feature
bcdedit /set disabledynamictick yes

rem # TSC Sync Policy
bcdedit /set tscsyncpolicy enhanced

PAUSE