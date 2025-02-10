rem # Disable MIDI 2.0 services

rem # MIDI 2.0 Virtual Devices
pnputil /disable-device "SWD\MIDISRV\MIDIU_APP_TRANSPORT"

rem # Diagnostics Ping (Internal)
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_PING"

rem # Diagnostics Loopback B
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_B"

rem # Diagnostics Loopback A
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_A"

rem # MIDI 2.0 Diagnostics Devices
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_TRANSPORT"

net stop midisrv

reg add "HKLM\SYSTEM\CurrentControlSet\Services\midisrv" /v "Start" /t REG_DWORD /d "4" /f

PAUSE