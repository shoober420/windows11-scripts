rem # Timer Tweaks

rem # useplatformclock not found by default, setting not present unless enabled prior
bcdedit /deletevalue useplatformclock

bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /set tscsyncpolicy enhanced

PAUSE