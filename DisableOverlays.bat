rem # Disable Overlays for GPU

rem # !!! WARNING !!!
rem # MAY CAUSE CRASHES, FLICKERING, AND LOW FPS, USE EnableOverlays.bat TO FIX
rem # !!! WARNING !!!

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d 1 /f

PAUSE