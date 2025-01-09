rem # Disables BitLocker

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

PAUSE