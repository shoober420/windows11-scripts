rem # Disable TPM and SecureBoot

rem # MUST BE LAUNCHED BEFORE WINDOWS 11 INSTALLATION TO DISABLE TPM AND SECUREBOOT

rem # TPM AND SECUREBOOT MUST BE DISABLED TO DO A WINRE "RESET THIS PC" WITHOUT A RECOVERY KEY BEING NEEDED

rem # RUFUS:
rem # - Remove requirement for 4GB+ RAM, Secure Boot and TPM 2.0
rem # - Disable BitLocker automatic device encryption
rem # REQUIRED TO FULLY DISABLE TPM, SECUREBOOT AND BITLOCKER 

rem # TPM AND SECUREBOOT ARE USED WITH WINDOWS PIN LOGIN, DONT TPM.MSC > CLEAR TPM, BORKS LOGIN

PAUSE

reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck " /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f

PAUSE