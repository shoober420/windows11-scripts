rem # MarkC Acceleration Fix
rem reg import "%USERPROFILE%\Downloads\MarkC_Windows_10+8.x+7_MouseFix\Windows 10 Fixes\Windows_10+8.x_MouseFix_ItemsSize=100%_Scale=1-to-1_@6-of-11.reg"
rem REGEDIT.EXE /s "%USERPROFILE%\Downloads\MarkC_Windows_10+8.x+7_MouseFix\Windows 10 Fixes\Windows_10+8.x_MouseFix_ItemsSize=100%_Scale=1-to-1_@6-of-11.reg"


rem # Binary form of MarkC patch
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseXCurve" /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000
reg add "HKCU\Control Panel\Mouse" /f /v "SmoothMouseYCurve" /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

PAUSE
