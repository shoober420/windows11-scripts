rem # Prevent Razer Synapse auto install (rubber ducky attack)

rem # OpenRGB (buggy)
rem # if OpenRGB borks lighting and shuts it off even after rebooting, you will need to download the company software (NZXT CAM) and tweak it again to get it to turn on

rem # SignalRGB (bloat)

del C:\Windows\Installer\Razer
mkdir C:\Windows\Installer\Razer

icacls C:\Windows\Installer\Razer /deny Everyone:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny SYSTEM:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny Administrators:(OI)(CI)F /t /c

PAUSE