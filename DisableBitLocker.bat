rem # Disables BitLocker

rem # If asked for a recovery key when doing a WinRE "Refresh my PC", run this script

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

PAUSE