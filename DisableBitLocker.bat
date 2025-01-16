rem # Disables BitLocker

rem # Installing Windows 11 without TPM and SecureBoot in Rufus is required to fully disable BitLocker

rem # TPM AND SECUREBOOT MUST BE DISABLED TO DO A WINRE "RESET THIS PC" WITHOUT A RECOVERY KEY BEING NEEDED

rem # TPM AND SECUREBOOT ARE USED WITH WINDOWS PIN LOGIN, DONT TPM.MSC > CLEAR TPM, BORKS LOGIN

rem # RUFUS:
rem # - Remove requirement for 4GB+ RAM, Secure Boot and TPM 2.0
rem # - Disable BitLocker automatic device encryption
rem # REQUIRED TO FULLY DISABLE BITLOCKER

rem # DISABLE SECUREBOOT IN BIOS BEFORE MODIFIED RUFUS FRESH WINDOWS INSTALL

rem # TPM MUST BE ON IN BIOS FOR NEW WINDOWS UPDATE CANARY BUILDS TO INSTALL
rem # - SOME BIOS HAVE TPM ON, WHILE ALSO HAVING AN OPTION TO DISABLE WITH TPM SUPPORT ON

PAUSE

manage-bde -off C:
powershell.exe Disable-BitLocker -MountPoint "C:"

reg add "HKLM\System\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t REG_DWORD /d "1" /f

PAUSE