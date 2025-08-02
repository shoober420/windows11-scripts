rem # Disable Fullscreen Optimizations (FSO)

rem # https://learn.microsoft.com/en-us/answers/questions/3741077/fullscreen-optimizations-windows-registry?forum=windows-all&referrer=answers

rem # https://en.ittrip.xyz/windows10/registry-tweaks-gamedvr#google_vignette

rem # Fullscreen Exclusive (FSE)
rem # Desktop Screen Experience (DSE)

rem # 0 = FSO: ON / FSE: OFF
rem # 2 = FSO: OFF / FSE: ON
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f

rem # Honor User adjusted FSE value
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f

rem # Disable GameDVR Overlay
rem # ON = 0 / OFF = 2
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehaviorMode" /t REG_DWORD /d "2" /f

rem # Honor User adjusted DSE value
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserDSEBehaviorMode" /t REG_DWORD /d "1" /f

rem # Disable more FSO features
rem # Disable Color Management
rem # Disable GameDVR recording
rem # 0 = Enable More FSO Features / 1 = Disable FSO Features
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableFullScreenOptimizations" /t REG_DWORD /d "1" /f

PAUSE
