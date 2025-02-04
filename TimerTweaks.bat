rem # Timer Tweaks

rem # https://sites.google.com/view/melodystweaks/misconceptions-about-timers-hpet-tsc-pmt

rem # Leave HPET enabled in BIOS

rem # Disable HPET in Windows
rem # useplatformclock not found by default, setting not present unless enabled prior
bcdedit /deletevalue useplatformclock

rem # RTC (real time clock)
rem # Disable synthetic timers
bcdedit /set useplatformtick yes

rem # Disable Power Saving Feature
bcdedit /set disabledynamictick yes

rem # TSC Sync Policy
bcdedit /set tscsyncpolicy enhanced

PAUSE