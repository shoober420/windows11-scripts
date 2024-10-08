rem # Prevent Razer Synapse auto install (rubber ducky attack)
rem # use SignalRGB instead

del C:\Windows\Installer\Razer
mkdir C:\Windows\Installer\Razer

icacls C:\Windows\Installer\Razer /deny Everyone:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny SYSTEM:(OI)(CI)F /t /c
icacls C:\Windows\Installer\Razer /deny Administrators:(OI)(CI)F /t /c

PAUSE