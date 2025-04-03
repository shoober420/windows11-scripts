rem # Enable TouchPad

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad\Status" /v "Enabled" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v "AAPDisabled" /t REG_DWORD /d "0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v "ThreeFingerTapEnabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v "FourFingerSlideEnabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v "FourFingerTapEnabled" /t REG_DWORD /d "1" /f

PAUSE
