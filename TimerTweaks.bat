rem # Timer Tweaks

rem # useplatformclock should be missing by default, not present unless enabled prior
bcdedit /deletevalue useplatformclock

bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /set tscsyncpolicy enhanced

PAUSE