rem # Enable MIDI 2.0 services

reg add "HKLM\SYSTEM\CurrentControlSet\Services\midisrv" /v "Start" /t REG_DWORD /d "3" /f

net start midisrv

rem # MIDI 2.0 Virtual Devices
pnputil /enable-device "SWD\MIDISRV\MIDIU_APP_TRANSPORT"

rem # Diagnostics Ping (Internal)
pnputil /enable-device "SWD\MIDISRV\MIDIU_DIAG_PING"

rem # Diagnostics Loopback B
pnputil /enable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_B"

rem # Diagnostics Loopback A
pnputil /enable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_A"

rem # MIDI 2.0 Diagnostics Devices
pnputil /enable-device "SWD\MIDISRV\MIDIU_DIAG_TRANSPORT"

PAUSE