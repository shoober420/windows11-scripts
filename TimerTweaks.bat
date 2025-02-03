rem # Timer Tweaks

bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /set tscsyncpolicy enhanced

PAUSE