rem # Disable High Precision Event Timer

pnputil /disable-device "ACPI\PNP0103\0"

rem # Disable HPET (High Precision Event Timer)
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\HARDWARE\DEVICEMAP\ACPI\HPET" /v "Enable" /t REG_DWORD /d "0" /f

PAUSE