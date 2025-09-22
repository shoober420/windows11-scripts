rem # MarkC Acceleration Fix

rem # !!! WARNING !!!

rem # Scale items size must be 100%
rem # System > Display > Scale & layout > Scale: 100%

rem # Scale 100% = 96 DPI

rem # !!! WARNING !!!

PAUSE

rem reg import "%USERPROFILE%\Downloads\MarkC_Windows_10+8.x+7_MouseFix\Windows 10 Fixes\Windows_10+8.x_MouseFix_ItemsSize=100%_Scale=1-to-1_@6-of-11.reg"
rem REGEDIT.EXE /s "%USERPROFILE%\Downloads\MarkC_Windows_10+8.x+7_MouseFix\Windows 10 Fixes\Windows_10+8.x_MouseFix_ItemsSize=100%_Scale=1-to-1_@6-of-11.reg"

rem # Remove Windows Mouse Acceleration Curve (USE MARKC MOUSE FIX BELOW)

rem reg delete "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /f
rem reg delete "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /f

rem # 1/6/10 - Enhance pointer precision (Mouse Acceleration)

rem # Disable WelcomeScreen and Login Accel
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

rem # Binary conversion of MarkC mouse accel patch
rem # Windows_10+8.x_MouseFix_ItemsSize=100%_Scale=1-to-1_@6-of-11.reg

rem # MouseSensitivity (10 = Normal, 20 = Max)
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000
reg add "HKU\.DEFAULT\Control Panel\Mouse" /f /v "MouseSensitivity" /t REG_SZ /d "10"

reg add "HKCU\Control Panel\Mouse" /v RawInput /t REG_SZ /d 1 /f

reg add "HKCU\Control Panel\Mouse" /v "MouseAccel" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseAccel_Max" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseAccel_Scale" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "SnapToDefaultButton" /t REG_SZ /d "0" /f

PAUSE
