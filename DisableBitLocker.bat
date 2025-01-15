rem # Disables BitLocker

rem # Installing Windows 11 without TPM and SecureBoot in Rufus is required to fully disable BitLocker

rem # TPM AND SECUREBOOT MUST BE DISABLED TO DO A WINRE "RESET THIS PC" WITHOUT A RECOVERY KEY BEING NEEDED

rem # TPM AND SECUREBOOT ARE USED WITH WINDOWS PIN LOGIN, DONT TPM.MSC > CLEAR TPM, BORKS LOGIN

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

PAUSE