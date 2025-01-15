rem # Disables BitLocker

rem # Installing Windows 11 without TPM and SecureBoot in Rufus is required to fully disable BitLocker

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

PAUSE