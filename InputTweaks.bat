rem # !!!WARNING!!!
rem # VALUES NEED ADJUSTED TO MATCH USER HARDWARE
rem # !!!WARNING!!!

PAUSE

rem # DataQueueSize
rem # Mouse and keyboard buffer sizes
rem # Values too low cause mouse glitches/skipping and unregistered keyboard presses
rem # Mouse and keyboard values under 16 (0x00000016) require very good hardware
rem # https://www.clickspeedtester.com/keyboard-latency-test/

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000010" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000010" /f

rem # Enable NumLock at startup (0 = Disabled / 2 = Enable)
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d "2" /f

rem # Disable BSOD Hotkey (CTRL+ScrollLock twice)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "CrashOnCtrlScroll" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "CrashOnCtrlScroll" /t REG_DWORD /d "0" /f

rem # Repeat Rate
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f

rem # Repeat Delay
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "TypematicDelay" /t REG_DWORD /d "0" /f

rem # May increase latency when 1+
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f

rem # Mouse Human Interface Device tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsolutePointerAsAbsolute" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsoluteAsRelative" /t REG_DWORD /d "0" /f

rem # Fastest cursor update rate
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f

rem # Mouse Cursor Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "0" /f

reg add "HKCU\Control Panel\Mouse" /v "ActiveWindowTracking" /t REG_DWORD /d "0" /f



reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "SendOutputToAllPorts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "SendOutputToAllPorts" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ConnectMultiplePorts" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "MaximumPortsServiced" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardTransmitTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseTransmitTimeout" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "LayeredLatency" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardReportBufferCount" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseReportBufferCount" /t REG_DWORD /d "1" /f



PAUSE
