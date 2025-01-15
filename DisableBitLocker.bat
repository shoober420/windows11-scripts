rem # Disables BitLocker

rem # Installing Windows 11 without TPM and SecureBoot in Rufus is required to fully disable BitLocker

rem # TPM AND SECURE BOOT MUST BE DISABLED TO DO A WINRE "RESET THIS PC" WITHOUT A RECOVERY KEY BEING NEEDED

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

PAUSE