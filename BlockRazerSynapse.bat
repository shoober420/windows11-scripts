rem # Prevent Razer Synapse auto install (rubber ducky attack)

rem # NEVER INSTALL RGB SOFTWARE, LEAVE AT DEFAULTS

rem # OpenRGB (DANGEROUSLY BUGGY)
rem # OpenRGB can bork your RAM RGB by itself, and even fan rgb, along with led strips if used in conjuction with other RGB software

rem # if OpenRGB borks fan lighting and shuts it off even after rebooting, you will need to download the company software (NZXT CAM) and tweak it again to get it to turn on

rem # SignalRGB (bloat)
rem # SignalRGB needs to be running jn the background for RGB effects to work

del C:\Windows\Installer\Razer
mkdir C:\Windows\Installer\Razer

icacls C:\Windows\Installer\Razer /deny Everyone:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny SYSTEM:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny Administrators:(OI)(CI)F /t /c

PAUSE