rem # Enable AMD DalDramClockChangeLatencyNs tweak

rem # DalDramClockChangeLatencyNs below can cause screen flickering, delete reg key if flickering occurs

rem reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\DalDramClockChangeLatencyNs"

                         reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "DalDramClockChangeLatencyNs" /t REG_DWORD /d "1" /f