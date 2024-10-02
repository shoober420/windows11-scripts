rem # Disable Driver Signature Enforcement

bcdedit.exe -set loadoptions DISABLE_INTEGRITY_CHECKS
bcdedit.exe -set TESTSIGNING ON
bcdedit.exe -set nointegritychecks on

PAUSE