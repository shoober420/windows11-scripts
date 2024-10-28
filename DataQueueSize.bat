rem # Mouse and keyboard buffer sizes
rem # Values too low cause mouse glitches/skipping and unregistered keyboard presses
rem # Mouse and keyboard values under 16 require very good hardware
rem # https://www.clickspeedtester.com/keyboard-latency-test/

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000010" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000010" /f

rem # Repeat Rate
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f

rem # Repeat Delay
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "TypematicDelay" /t REG_DWORD /d "0" /f



PAUSE